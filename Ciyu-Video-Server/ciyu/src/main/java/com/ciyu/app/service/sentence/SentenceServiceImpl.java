package com.ciyu.app.service.sentence;

import com.ciyu.app.pojo.*;
import com.ciyu.app.service.bond.BondService;
import com.ciyu.app.service.openai.OpenAIService;
import lombok.RequiredArgsConstructor;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.AbstractMap;
import java.util.Comparator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service @RequiredArgsConstructor
public class SentenceServiceImpl implements SentenceService {
    private final BondService bondService;
    private final OpenAIService openAIService;
    @Override
    public Iterable<Sentence> searchBestSentencesByUser(User user, Pageable pageable, List<String> excludedSentenceIds) {
        return null;
    }

    @Override
    public String generateCompletionsByUser(User user, Pageable pageable, String beforeText, List<String> excludedWordIds) {
        List<Bond> bonds = bondService.findAllBondsByUser(user);
        List<Bond> filteredBonds = bonds.stream()
                .filter(bond -> !excludedWordIds.contains(bond.getWord().getId()))
                .toList();
        List<Bond> sortedBonds = filteredBonds.stream()
                .map(bond -> {
                    double strength = bondService.calculateStrengthByBond(bond);
                    double boost = strength * (1 - strength);
                    return new AbstractMap.SimpleEntry<>(bond, boost);
                })
                .sorted(Comparator.comparingDouble((AbstractMap.SimpleEntry<Bond, Double> entry) -> entry.getValue()).reversed())
                .map(AbstractMap.SimpleEntry::getKey)
                .collect(Collectors.toList());
        int size = Math.min(pageable.getPageSize(), sortedBonds.size());
        List<Bond> topBonds = sortedBonds.subList(0, size);

        String joinedWordIds = topBonds.stream()
                .map(bond -> bond.getWord().getId())
                .map(Object::toString)
                .collect(Collectors.joining(", "));

        String prompt = String.format("""
                我接下来要让你续写一个英语小故事，只续写%d句话，并且每句必须用上我给你的词。
                单词：%s
                上文：%s
                请只给出你续写的部分:""", size, joinedWordIds, beforeText);
        String result = openAIService.requestCompletions(prompt).trim().replace("\n\n", "\n");
        return highlightText(result, bonds.stream().map(bond -> bond.getWord().getId()).toList());
    }

    public static String highlightText(String text, List<String> keywords) {
        for (String keyword : keywords) {
            String escapedKeyword = Pattern.quote(keyword);
            Pattern pattern = Pattern.compile("(?<=\\W|^)" + escapedKeyword + "(?=\\W|$)");
            Matcher matcher = pattern.matcher(text);
            StringBuilder sb = new StringBuilder();

            while (matcher.find()) {
                matcher.appendReplacement(sb, "<em>" + matcher.group() + "</em>");
            }
            matcher.appendTail(sb);
            text = sb.toString();
        }
        return text;
    }
}
