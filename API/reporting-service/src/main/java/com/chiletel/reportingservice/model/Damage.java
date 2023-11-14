package com.chiletel.reportingservice.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.time.Duration;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "DAMAGE")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Damage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DAMAGE_ID")
    private Long damageId;

    @Column(name = "DESCRIPTION", nullable = false, length = 200)
    private String description;

    @Column(name = "PRIORITY", nullable = false)
    private Integer priority;

    @Column(name = "ESTIMATED_DURATION")
    private Duration estimatedDuration;  // Usando java.time.Duration para representar INTERVAL DAY TO SECOND

    // Getters, Setters, Constructors
}
