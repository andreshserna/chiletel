package com.chiletel.usermanagementservice.repository;

import com.chiletel.usermanagementservice.model.Crew;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CrewRepository extends JpaRepository<Crew, Long> {
    
}
