package com.ciyu.app.controller;

import com.ciyu.app.dto.word.WordDto;
import com.ciyu.app.pojo.User;
import com.ciyu.app.pojo.Word;
import com.ciyu.app.security.CurrentUser;
import com.ciyu.app.security.IgnoreSecurity;
import com.ciyu.app.service.word.WordService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController @RequiredArgsConstructor
@RequestMapping("/api/v1/words")
public class WordController {
    private final WordService wordService;

    @GetMapping("/{id}")
    WordDto getWordById(@CurrentUser User user, @PathVariable("id") String id) {
        return wordService.findWordDtoByIdAndUser(id, user);
    }

    @GetMapping
    List<WordDto> extractWordsByTask(@CurrentUser User user, @RequestParam String task) {
        return wordService.findWordsDtoByTaskAndUser(task, user);
    }
}
