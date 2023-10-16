package com.segurosbolivar.api.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TransactionDTO {
    private Long TransactionId;
    private String TransactionType;
    private String bankBranch;
    private Long accountId;
    private Long destinationAccountId;
    private Double amount;
    private Date created_at;
}
