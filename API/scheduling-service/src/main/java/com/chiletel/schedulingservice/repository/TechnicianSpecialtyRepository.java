package com.chiletel.schedulingservice.repository;

import com.chiletel.schedulingservice.model.TechnicianSpecialty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TechnicianSpecialtyRepository extends JpaRepository<TechnicianSpecialty, Long> {
    Optional<TechnicianSpecialty> findByTechnician_TechnicianIdAndDamage_DamageId(Long technicianId, Long damageId);
}
