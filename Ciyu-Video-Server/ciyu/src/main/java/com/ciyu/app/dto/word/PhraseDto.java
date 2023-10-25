package com.ciyu.app.dto.word;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class PhraseDto {
    private String id;
    private String definition;
    private String explain;
}
