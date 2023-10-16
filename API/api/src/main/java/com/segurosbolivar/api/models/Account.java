package com.segurosbolivar.api.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account {
    private Long accountId;
    private Long customerId;
    private Long accountTypeId;
    private Long createdBranchId;
    private Double balance;
    private String password;
    private Date closingDate;
}
