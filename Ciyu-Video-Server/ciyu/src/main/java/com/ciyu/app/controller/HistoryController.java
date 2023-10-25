package com.ciyu.app.controller;

import com.ciyu.app.pojo.Article;
import com.ciyu.app.pojo.History;
import com.ciyu.app.pojo.User;
import com.ciyu.app.security.CurrentUser;
import com.ciyu.app.service.article.ArticleService;
import com.ciyu.app.service.history.HistoryService;
import io.swagger.v3.oas.annotations.Parameter;
import lombok.RequiredArgsConstructor;
import org.springdoc.core.converters.models.PageableAsQueryParam;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/histories")
public class HistoryController {
    private final HistoryService historyService;
    private final ArticleService articleService;

    @PostMapping
    void createHistory(@CurrentUser User user, String articleId){
        historyService.saveHistory(new History().setUser(user).setArticleId(articleId));
    }

    @GetMapping  @PageableAsQueryParam
    SearchHits<Article> getPaginatedHistories(@CurrentUser User user, @Parameter(hidden = true) Pageable pageable) {
        Page<History> histories = historyService.findPaginatedHistoriesByUser(user, pageable);
        return articleService.searchArticlesByPaginatedHistories(user, histories);
    }
}
