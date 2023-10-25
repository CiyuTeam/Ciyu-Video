package com.ciyu.app.service.word;

import com.ciyu.app.dto.word.PhraseDto;
import com.ciyu.app.dto.word.WordDto;
import com.ciyu.app.pojo.Meaning;
import com.ciyu.app.pojo.Phonetic;
import com.ciyu.app.pojo.User;
import com.ciyu.app.pojo.Word;
import com.ciyu.app.repository.BondRepo;
import com.ciyu.app.repository.MeaningRepo;
import com.ciyu.app.repository.PhoneticRepo;
import com.ciyu.app.repository.WordRepo;
import com.ciyu.app.service.openai.OpenAIService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.unfbx.chatgpt.OpenAiClient;
import com.unfbx.chatgpt.entity.common.Choice;
import com.unfbx.chatgpt.entity.completions.Completion;
import com.unfbx.chatgpt.entity.completions.CompletionResponse;
import com.unfbx.chatgpt.interceptor.OpenAILogger;
import com.unfbx.chatgpt.interceptor.OpenAiResponseInterceptor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
@RequiredArgsConstructor
public class OnlineWordService implements WordService {
    private final WordRepo wordRepo;
    private final MeaningRepo meaningRepo;
    private final PhoneticRepo phoneticRepo;
    private final BondRepo bondRepo;
    private final OpenAIService openAIService;

    @Override
    public WordDto findWordDtoByIdAndUser(String id, User user) {
        return wordRepo.findById(id).map(word -> {
            WordDto wordDto = new WordDto();
            BeanUtils.copyProperties(word, wordDto);
            boolean hasBond = bondRepo.existsByUserAndWord(user, word);
            return wordDto.setHasBond(hasBond);
        }).orElseGet(() -> {
            WordDto wordDto = new WordDto();
            Word word = requestWordById(id);
            List<Meaning> meanings = word.getMeanings();
            List<Phonetic> phonetics = word.getPhonetics();
            wordRepo.save(word);
            meaningRepo.saveAll(meanings);
            phoneticRepo.saveAll(phonetics);
            BeanUtils.copyProperties(word, wordDto);
            return wordDto.setHasBond(false);
        });
    }

    @Override
    public Word findWordById(String id) {
        return wordRepo.findById(id).orElseThrow(() -> new RuntimeException("Word Not Found"));
    }

    private Word requestWordById(String id) {
        String url = "https://youdao.com/result?lang=en&word=" + id;
        String body = new RestTemplate().getForObject(url, String.class);
        if (body == null) throw new RuntimeException("Body is Null");
        Document doc = Jsoup.parse(body);
        // String id = doc.select(".word").text()
        Word word = new Word().setId(id);
        List<Phonetic> phonetics = doc.select(".per-phone").stream().map(element ->
                new Phonetic()
                        .setLocale(element.select("span:first-child").text())
                        .setSymbol(element.select(".phonetic").text())
                        .setWord(word)
                        .setAudio(String.format("https://dict.youdao.com/dictvoice?audio=%s&type=%d", id, element.ownText().equals("英") ? 1 : 2))).toList();
        List<String> definitions = doc.select(".basic>.word-exp").eachText();
        List<Meaning> meanings = definitions.stream().map(definition -> new Meaning().setDefinition(definition).setWord(word)).toList();
        return word.setMeanings(meanings).setPhonetics(phonetics);
    }


    @Override
    public List<WordDto> findWordsDtoByTaskAndUser(String task, User user) {
        List<Word> extractedWords = requestWordsByTask(task);
        return extractedWords.stream().map(extractedWord -> wordRepo.findById(extractedWord.getId()).map(word -> {
            meaningRepo.saveAll(extractedWord.getMeanings());
            WordDto wordDto = new WordDto();
            BeanUtils.copyProperties(extractedWord, wordDto);
            boolean hasBond = bondRepo.existsByUserAndWord(user, word);
            return wordDto.setHasBond(hasBond);
        }).orElseGet(() -> {
            WordDto wordDto = new WordDto();
            wordRepo.save(extractedWord);
            BeanUtils.copyProperties(extractedWord, wordDto);
            return wordDto.setHasBond(false);
        })).toList();
    }

    private List<Word> requestWordsByTask(String task) {


        String prompt = String.format("现有一个识别单词原型及其在文段中出现的常用搭配、并给出其在在文段所给语境中的特定用法的任务，它模拟的是：当人点击屏幕上的单词时，自动识别其想要查询的短语或词形还原后的单词，并辅助其记忆，结果需要用json返回，不应包括其他无关信息，示例如下。\n" +
                "示例一：\n" +
                "I always make sure to [take] my responsibilities seriously when working on a project.\n" +
                "[{\"id\":\"take something seriously\",\"definition\":\"认真对待...;\",\"explain\":\"这里的\\\"take my responsibilities seriously\\\" 表示”我“很重视在工作项目中的责任\"},{\"id\":\"take\",\"definition\":\"对待\",\"explain\":\"这里的\\\"take\\\" 表示对待某事，是说”我“在工作项目中始终认真对待自己的责任。\"}]\n" +
                "示例二：\n" +
                "Her sister carefully [laid] the book on the table before going to bed.\n" +
                "[{\"id\":\"lay something on\",\"definition\":\"把某物放在...上;\",\"explain\":\"在这个句子中，\\\"lay\\\" 是一个动词，结合 \\\"on\\\" 使用，表示将书本放置在桌子上。\"}, {\"id\":\"lay\",\"definition\":\"放置;\",\"explain\":\"\\\"laid\\\"是\\\"lay\\\"的过去式，用来描述姐姐的动作，即放置书本在桌子上。\"}]\n" +
                "示例三：\n" +
                "The film stands head and [shoulders] above 99.9 per cent of post-70's Hollywood product.\n" +
                "[{\"id\": \"stand head and shoulders above\",\"definition\": \"远远好于...\",\"explain\": \"这个词组用来比喻表示某件事物要远远好于另一件事物。这个词组也可以说成\\\"stand above something\\\"，意思是相同的\"},{\"id\": \"shoulder\",\"definition\": \"肩膀\",\"explain\": \"\\\"shoulders\\\"表示肩膀，用来比喻某件事物要远远好于另一件事物。\"}]\n" +
                "示例四：\n" +
                "I can tell April is totally [enamored] with her new boyfriend—she won't stop talking about him.\n" +
                "[{\"id\": \"be enamored with\",\"definition\": \"对...着迷;\",\"explain\": \"be enamored with表示主语April对她的新男朋友非常着迷，她对他不停地谈论，无法自拔。这里表示的是April对他的爱意，是一种积极的情感。\"},{\"id\": \"enamored\",\"definition\": \"迷恋的; 爱上…的;\",\"explain\": \"enamored表示主语April对她的新男朋友非常着迷，是一种积极的情感。\"}]\n" +
                "示例五：\n" +
                "I don't know what that guy said to him but, all of a sudden, it was on for young and old and punches were being [thrown]!\n" +
                "[{\"id\": \"throw punches\",\"definition\": \"挥拳猛击;\",\"explain\": \"这里的\\\"throw punches\\\" 使用了被动语态。表示”我“不知道那个人对他朋友说了什么，但突然间他们之间就开始了争吵，甚至动起了手打架。\"},{\"id\": \"punches\",\"definition\": \"拳头（通常指打人时使用的拳头）\",\"explain\": \"在这个句子中，\\\"punches\\\" 用来描述当时发生的事情是一个打斗事件，两个人在争吵的过程中开始了肢体冲突，使用拳头互相攻击。\"}]\n" +
                "示例六：\n" +
                "The whole structure is as strong as [an] oak!\n" +
                "[{\"id\": \"as strong as an oak\",\"definition\": \"和一棵橡树一样坚固\",\"explain\": \"这个句子是说整体结构和橡树一样坚固。\"},{\"id\": \"an\",\"definition\": \"一个\",\"explain\": \"在这个句子中，\\\"an\\\" 是一个冠词，用于修饰名词 \\\"oak\\\"，表示这个整体结构和一棵橡树一样坚固。注意，\\\"an\\\" 和 \\\"a\\\" 的用法相同，但是 \\\"a\\\" 用于辅音音素开头的单词，而 \\\"an\\\" 用于元音音素开头的单词\"}]\n" +
                "示例七：\n" +
                "He's been in the shadow [of] his father for his entire political career.\n" +
                "[{\"id\": \"in the shadow of\",\"definition\": \"处于…的阴影之下\",\"explain\": \"这是一个习惯用语，通常用于描述某人处于另一个人的影响范围之内。这里的\\\"in the shadow of\\\"表示他整个政治生涯都处于父亲的阴影之下，意味着他一直无法从父亲的影响中脱身。\"},{\"id\": \"of\",\"definition\": \"属于...的; \",\"explain\": \"在这个句子中，\\\"of\\\"表示所属关系，表示阴影指的是父亲的阴影。\"}]\n" +
                "\n" +
                "接下来给出试验文段：%s\n" +
                "\n" +
                "The word to be recognized has been marked with [], \n" +
                "ATTENTION: the phrases appearing in the returned results should contain the word to be recognized, \n" +
                "ATTENTION: the returned result must include the prototype of the word marked with [],\n" +
                "Please provide the result.", task);


        String json = openAIService.requestCompletions(prompt);
        try {
            writeFile(json);
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println(json);
        // 将JSON字符串解析为Phrase列表
        Gson gson = new Gson();
        Type listType = new TypeToken<List<PhraseDto>>() {
        }.getType();
        List<PhraseDto> phrases = gson.fromJson(json, listType);
        return phrases.stream().map(phraseDto -> {
            Meaning meaning = new Meaning().setDefinition(phraseDto.getDefinition() + "\n" + phraseDto.getExplain());
            Word word = new Word().setId(phraseDto.getId()).setMeanings(Collections.singletonList(meaning));
            meaning.setWord(word);
            return word;
        }).toList();
    }
    private static void writeFile(String content) throws IOException {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter("output.txt"))) {
            writer.write(content);
        }
    }
}