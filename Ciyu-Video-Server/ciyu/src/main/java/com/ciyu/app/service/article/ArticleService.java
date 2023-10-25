package com.ciyu.app.service.article;

import com.ciyu.app.pojo.Article;
import com.ciyu.app.pojo.History;
import com.ciyu.app.pojo.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.SearchHits;

import java.util.List;

public interface ArticleService {
    SearchHits<Article> searchBestArticlesByUser(User user, Pageable pageable, List<String> excludedArticleIds, String source);

    SearchHits<Article> searchArticlesByUserAndWordId(User user, String wordId, Pageable pageable);
    SearchHits<Article> searchArticlesByPaginatedHistories(User user, Page<History> histories);
    Article findArticleById(String id);
}
