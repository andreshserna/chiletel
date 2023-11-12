package com.chiletel.schedulingservice.repository;

import com.chiletel.schedulingservice.model.Technician;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TechnicianRepository extends JpaRepository<Technician, Long> {

}
