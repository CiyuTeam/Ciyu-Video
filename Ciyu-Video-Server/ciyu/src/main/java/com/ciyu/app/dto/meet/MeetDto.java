package com.ciyu.app.dto.meet;

import com.ciyu.app.pojo.Article;
import com.ciyu.app.pojo.Meaning;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * A DTO for the {@link com.ciyu.app.pojo.Meet} entity
 */
@Data
public class MeetDto implements Serializable {
    private String id;
    private Double quality;
    private LocalDateTime createdTime;
    private Meaning meaning;
    private Article article;
}