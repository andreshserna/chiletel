package com.segurosbolivar.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountDTO {
    private Long accountId;
    private String customerName;
    private String accountType;
    private String createdBranch;
    private Double balance;
    private Date closingDate;
}
