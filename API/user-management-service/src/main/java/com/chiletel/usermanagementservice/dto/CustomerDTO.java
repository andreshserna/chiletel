package com.chiletel.usermanagementservice.dto;

import lombok.Data;
import java.time.LocalDateTime;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
@Data
public class CustomerDTO {

    private Long customerId;
    
    @NotEmpty(message = "Name cannot be empty")
    private String name;

    @NotEmpty(message = "Address cannot be empty")
    private String address;

    @NotEmpty(message = "District cannot be empty")
    private String district;

    @NotNull(message = "Type cannot be null")
    private Integer type;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
