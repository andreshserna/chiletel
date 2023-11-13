package com.chiletel.damageorderservice.repository;

import com.chiletel.damageorderservice.model.AttentionOrder;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttentionOrderRepository extends JpaRepository<AttentionOrder, Long> {
	
	
	List<AttentionOrder> findByCustomerCustomerId(Long customerId);
	
	List<AttentionOrder> findByTechnicianTechnicianId(Long technicianId);
	
}
