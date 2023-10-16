package com.segurosbolivar.api.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigInteger;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Transaction {
    private Long TransactionId;
    private Long TransactionTypeId;
    private Long bankBranchId;
    private Long accountId;
    private Long destinationAccountId;
    private Double amount;
    private Date created_at;
}
