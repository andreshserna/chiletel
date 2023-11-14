package com.chiletel.reportingservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "CREW")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Crew {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CREW_ID", nullable = false)
    private Long crewId;

    @Column(name = "NAME", nullable = false, length = 80)
    private String name;

    @Column(name = "ZONE", nullable = false, length = 50)
    private String zone;
}
