package com.chiletel.damageorderservice.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.chiletel.damageorderservice.model.Technician;

public interface TechnicianRepository extends JpaRepository<Technician, Long> {
}

