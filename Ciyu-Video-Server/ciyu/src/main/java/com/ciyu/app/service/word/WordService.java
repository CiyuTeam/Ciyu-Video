package com.ciyu.app.service.word;

/*
需要有以下功能：
1. (单词id) => 单词
 */

import com.ciyu.app.dto.word.WordDto;
import com.ciyu.app.pojo.User;
import com.ciyu.app.pojo.Word;

import java.util.List;

public interface WordService {
    WordDto findWordDtoByIdAndUser(String id, User user);
    List<WordDto> findWordsDtoByTaskAndUser(String task, User user);
    Word findWordById(String id);
}
