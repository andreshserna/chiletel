package com.chiletel.damageorderservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Duration;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttentionOrderDTO {

    private Long orderId;
    private String orderDescription;
    private LocalDate reportDate;
    private Long customerId;
    private Long damageId;
    private Long technicianId;
    private Duration duration;
    private LocalDate fixedDate;
}
