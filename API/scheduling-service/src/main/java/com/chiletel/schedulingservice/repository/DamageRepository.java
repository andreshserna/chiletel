package com.chiletel.schedulingservice.repository;


import com.chiletel.schedulingservice.model.Damage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DamageRepository extends JpaRepository<Damage, Long> {
	
}
