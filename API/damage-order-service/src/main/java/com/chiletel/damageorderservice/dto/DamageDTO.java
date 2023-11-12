package com.chiletel.damageorderservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Duration;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DamageDTO {

    private Long damageId;
    private String description;
    private Integer priority;
    private Duration estimatedDuration;
}
