package com.ciyu.app.service.history;

import com.ciyu.app.pojo.History;
import com.ciyu.app.pojo.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface HistoryService {
    void saveHistory(History history);
    Iterable<History> findRecentHistoriesByUser(User user);
    Page<History> findPaginatedHistoriesByUser(User user, Pageable pageable);
}
