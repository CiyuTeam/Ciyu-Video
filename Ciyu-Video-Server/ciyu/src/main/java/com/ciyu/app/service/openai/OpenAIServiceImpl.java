package com.ciyu.app.service.openai;

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
public class OpenAIServiceImpl implements OpenAIService {

    @Override
    public String requestCompletions(String prompt) {
        // 国内访问需要做代理，国外服务器不需要
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("127.0.0.1", 7890));
        HttpLoggingInterceptor httpLoggingInterceptor = new HttpLoggingInterceptor(new OpenAILogger());
        // ！！！！千万别再生产或者测试环境打开BODY级别日志！！！！
        // ！！！生产或者测试环境建议设置为这三种级别：NONE,BASIC,HEADERS,！！！
        httpLoggingInterceptor.setLevel(HttpLoggingInterceptor.Level.HEADERS);
        OkHttpClient okHttpClient = new OkHttpClient
                .Builder()
                .proxy(proxy)//自定义代理
                .addInterceptor(httpLoggingInterceptor)//自定义日志输出
                .addInterceptor(new OpenAiResponseInterceptor())//自定义返回值拦截
                .connectTimeout(10, TimeUnit.SECONDS)//自定义超时时间
                .writeTimeout(30, TimeUnit.SECONDS)//自定义超时时间
                .readTimeout(30, TimeUnit.SECONDS)//自定义超时时间
                .build();
        // 构建客户端
        OpenAiClient openAiClient = OpenAiClient.builder()
                .apiKey(Collections.singletonList("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"))
                // 自定义key的获取策略：默认KeyRandomStrategy
                //.keyStrategy(new KeyRandomStrategy())
                .okHttpClient(okHttpClient)
                // 自己做了代理就传代理地址，没有可不不传
                //.apiHost("https://自己代理的服务器地址/")
                .build();
        Completion completion = Completion.builder().prompt(prompt).model("text-davinci-002").maxTokens(1024).temperature(0.5).bestOf(1).build();
        CompletionResponse completionResponse = openAiClient.completions(completion);
        List<Choice> choices = Arrays.asList(completionResponse.getChoices());
        if (choices.isEmpty())
            throw new RuntimeException("Choices Are Empty");
        return choices.get(0).getText();
    }
}