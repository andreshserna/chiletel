package com.chiletel.schedulingservice.repository;

import com.chiletel.schedulingservice.model.Crew;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CrewRepository extends JpaRepository<Crew, Long> {
    
}
