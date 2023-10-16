package com.segurosbolivar.api.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    private Long customerId;
    private String firstName;
    private String secondName;
    private String lastName;
    private String second_lastName;
    private Date birtdate;
    private String document;
    private Long documentTypeId;
    private String address;
    private String email;
    private String phoneNumber;
    private String password;
}
