package com.chiletel.usermanagementservice.repository;

import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicianSpecialtyRepository extends JpaRepository<TechnicianSpecialty, Long> {
    
}
