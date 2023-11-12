package com.chiletel.damageorderservice.repository;

import com.chiletel.damageorderservice.model.AttentionOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttentionOrderRepository extends JpaRepository<AttentionOrder, Long> {
	
}
