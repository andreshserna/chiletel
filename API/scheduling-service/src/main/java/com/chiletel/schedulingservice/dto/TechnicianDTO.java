package com.chiletel.schedulingservice.dto;

import lombok.Data;

@Data
public class TechnicianDTO {

    private Long technicianId;
    private String name;
    private String document;
    private String documentType;
    private Long crewId; // Referenciadt a Crew 
}
