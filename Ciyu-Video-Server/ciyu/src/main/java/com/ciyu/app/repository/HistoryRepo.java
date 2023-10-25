package com.ciyu.app.repository;

import com.ciyu.app.pojo.History;
import com.ciyu.app.pojo.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Repository
@Transactional
public interface HistoryRepo extends CrudRepository<History, String> {
    Iterable<History> findAllByUserAndCreatedTimeAfter(User user, @NotNull LocalDateTime createdTime);
    Page<History> findDistinctByUser(User user, Pageable pageable);

}
