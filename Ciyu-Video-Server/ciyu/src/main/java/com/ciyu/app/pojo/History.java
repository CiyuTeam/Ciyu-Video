package com.ciyu.app.pojo;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity @Data
@Table(name = "HISTORY", indexes = {
        @Index(name = "IDX_HISTORY_USER_ID", columnList = "USER_ID")
})
@Accessors(chain = true)
public class History {
    @Column(name = "ID", nullable = false)
    @Id
    @GeneratedValue(generator="system_uuid")
    @GenericGenerator(name="system_uuid",strategy="uuid")
    private String id;


    @Column(name = "ARTICLE_ID", nullable = false)
    @NotNull
    private String articleId;

    @CreationTimestamp
    @Column(name = "CREATED_TIME", nullable = false)
    private LocalDateTime createdTime;

    @JoinColumn(name = "USER_ID", nullable = false)
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JsonBackReference
    private User user;
}