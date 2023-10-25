package com.ciyu.app.controller;

import com.ciyu.app.pojo.User;
import com.ciyu.app.security.CurrentUser;
import com.ciyu.app.service.sentence.SentenceService;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.converters.models.PageableAsQueryParam;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/sentences")
public class SentenceController {
//    SentenceService sentenceService;
//    @GetMapping @PageableAsQueryParam
//    public Iterable<Sentence> getBestSentences(@CurrentUser User user, @Parameter(hidden = true) Pageable pageable, @RequestParam List<String> excludedSentenceIds) {
//        return sentenceService.searchBestSentencesByUser(user, pageable, excludedSentenceIds);
//    }
    private final SentenceService sentenceService;
    @GetMapping ("/generated")
    @PageableAsQueryParam
    public String generateCompletions(@CurrentUser User user, @Parameter(hidden = true) Pageable pageable, String beforeText, @RequestParam List<String> excludedWordIds) {
        return sentenceService.generateCompletionsByUser(user, pageable, beforeText, excludedWordIds);
    }
}
