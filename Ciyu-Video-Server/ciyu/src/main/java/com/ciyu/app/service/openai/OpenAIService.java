package com.ciyu.app.service.openai;

/*
需要有以下功能：
1. (单词id) => 单词
 */

import com.ciyu.app.dto.word.WordDto;
import com.ciyu.app.pojo.User;
import com.ciyu.app.pojo.Word;

import java.util.List;

public interface OpenAIService {
    String requestCompletions(String prompt);
}
