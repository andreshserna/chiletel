package com.chiletel.usermanagementservice.repository;

import com.chiletel.usermanagementservice.model.Technician;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicianRepository extends JpaRepository<Technician, Long> {

}
