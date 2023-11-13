package com.chiletel.damageorderservice.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.chiletel.damageorderservice.util.DurationConverter;
import javax.persistence.*;
import java.time.Duration;
import java.time.LocalDate;

@Entity
@Table(name = "ATTENTION_ORDER")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttentionOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ORDER_ID")
    private Long orderId;

    @Column(name = "ORDER_DESCRIPTION", length = 200)
    private String orderDescription;

    @Column(name = "REPORT_DATE", nullable = true)
    private LocalDate reportDate;

    @ManyToOne
    @JoinColumn(name = "CUSTOMER_ID", nullable = false)
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "DAMAGE_ID", nullable = false)
    private Damage damage;

    @ManyToOne
    @JoinColumn(name = "TECHNICIAN_ID")
    private Technician technician;

    @Convert(converter = DurationConverter.class)
    @Column(name = "DURATION")
    private Duration duration;

    @Column(name = "FIXED_DATE")
    private LocalDate fixedDate;
}
