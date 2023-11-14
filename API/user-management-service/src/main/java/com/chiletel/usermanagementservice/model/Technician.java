package com.chiletel.usermanagementservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "TECHNICIAN")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Technician {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TECHNICIAN_ID", nullable = false)
    private Long technicianId;

    @Column(name = "NAME", nullable = false, length = 100)
    private String name;

    @Column(name = "DOCUMENT", nullable = false, length = 20)
    private String document;

    @Column(name = "DOCUMENT_TYPE", nullable = false, length = 20)
    private String documentType;

    @ManyToOne
    @JoinColumn(name = "CREW_ID", nullable = false, foreignKey = @ForeignKey(name = "FK_TECHNICIAN_CREW"))
    private Crew crew;
    
    public void setId(Long technicianId) {
        this.technicianId = technicianId;
    }
    
    
}
