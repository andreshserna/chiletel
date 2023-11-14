package com.chiletel.usermanagementservice.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.EmbeddedId;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "TECHNICIAN_SPECIALTY")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TechnicianSpecialty {

    @EmbeddedId
    private TechnicianSpecialtyId id;

    @ManyToOne
    @MapsId("technicianId")
    @JoinColumn(name = "TECHNICIAN_ID", insertable = false, updatable = false)
    private Technician technician;

    @ManyToOne
    @MapsId("damageId")
    @JoinColumn(name = "DAMAGE_ID", insertable = false, updatable = false)
    private Damage damage;
    

}
