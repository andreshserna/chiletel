package com.chiletel.damageorderservice.repository;

import com.chiletel.damageorderservice.model.Damage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DamageRepository extends JpaRepository<Damage, Long> {
	
}
