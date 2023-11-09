package com.chiletel.usermanagementservice.dto;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class CustomerDTO {

    private Long customerId;
    private String name;
    private String address;
    private String district;
    private Integer type;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
