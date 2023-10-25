package com.ciyu.app.service.history;

import com.ciyu.app.pojo.History;
import com.ciyu.app.pojo.User;
import com.ciyu.app.repository.HistoryRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service @RequiredArgsConstructor
public class HistoryServiceImpl implements HistoryService{
    private final HistoryRepo historyRepo;

    @Override
    public void saveHistory(History history) {
        historyRepo.save(history);
    }

    @Override
    public Iterable<History> findRecentHistoriesByUser(User user) {
        return historyRepo.findAllByUserAndCreatedTimeAfter(user, LocalDateTime.now().minusWeeks(1));
    }

    @Override
    public Page<History> findPaginatedHistoriesByUser(User user, Pageable pageable) {
        return historyRepo.findDistinctByUser(user, pageable);
    }
}
