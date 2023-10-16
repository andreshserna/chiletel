package com.segurosbolivar.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerDTO {
    private Long customerId;
    private String fullName;
    private String document;
    private String documentType;
    private String address;
    private String email;
    private String phoneNumber;
}
