package com.chiletel.usermanagementservice.dto;

import lombok.Data;

@Data
public class TechnicianDTO {

    private Long technicianId;
    private String name;
    private String document;
    private String documentType;
    private Long crewId;
}
