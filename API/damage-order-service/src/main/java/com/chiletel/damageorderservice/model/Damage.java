package com.chiletel.damageorderservice.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

import com.chiletel.damageorderservice.util.DurationConverter;

import java.time.Duration;

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

    @Convert(converter = DurationConverter.class)
    @Column(name = "ESTIMATED_DURATION")
    private Duration estimatedDuration;
}
