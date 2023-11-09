package com.chiletel.usermanagementservice.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@Table(name = "TECHNICIAN_SPECIALTY")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TechnicianSpecialty {

    @Id
    @Column(name = "TECHNICIAN_ID")
    private Long technicianId;

    @Column(name = "DAMAGE_ID")
    private Long damageId;

    @ManyToOne
    @JoinColumn(name = "TECHNICIAN_ID", insertable = false, updatable = false)
    private Technician technician;

    @ManyToOne
    @JoinColumn(name = "DAMAGE_ID", insertable = false, updatable = false)
    private Damage damage;

}
