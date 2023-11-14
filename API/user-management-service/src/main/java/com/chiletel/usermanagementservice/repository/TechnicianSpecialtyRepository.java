package com.chiletel.usermanagementservice.repository;

import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TechnicianSpecialtyRepository extends JpaRepository<TechnicianSpecialty, Long> {
    Optional<TechnicianSpecialty> findByTechnician_TechnicianIdAndDamage_DamageId(Long technicianId, Long damageId);
    
    List<TechnicianSpecialty> findByIdTechnicianId(Long technicianId);
}
