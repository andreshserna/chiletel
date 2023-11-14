package com.chiletel.damageorderservice.service;

import com.chiletel.damageorderservice.dto.AttentionOrderDTO;
import com.chiletel.damageorderservice.model.AttentionOrder;
import com.chiletel.damageorderservice.model.Technician;
import com.chiletel.damageorderservice.repository.AttentionOrderRepository;
import com.chiletel.damageorderservice.repository.TechnicianRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AttentionOrderService {

	private final AttentionOrderRepository attentionOrderRepository;
    private final TechnicianRepository technicianRepository; // Asegúrate de tener esta línea

    @Autowired
    public AttentionOrderService(AttentionOrderRepository attentionOrderRepository, TechnicianRepository technicianRepository) {
        this.attentionOrderRepository = attentionOrderRepository;
        this.technicianRepository = technicianRepository; // Asignación correcta
    }

    public List<AttentionOrder> getAllOrders() {
        return attentionOrderRepository.findAll();
    }

    public Optional<AttentionOrder> getOrderById(Long id) {
        return attentionOrderRepository.findById(id);
    }

    public AttentionOrder saveOrder(AttentionOrder order) {
        return attentionOrderRepository.save(order);
    }
    
    public List<AttentionOrder> getOrdersByCustomerId(Long customerId) {
        return attentionOrderRepository.findByCustomerCustomerId(customerId);
    }
    
    public List<AttentionOrder> getOrdersByTechnicianId(Long technicianId) {
        return attentionOrderRepository.findByTechnicianTechnicianId(technicianId);
    }
    
    public Optional<AttentionOrder> assignTechnician(Long orderId, Long technicianId) {
        return getOrderById(orderId).flatMap(order -> technicianRepository.findById(technicianId).map(technician -> {
            order.setTechnician(technician);
            return attentionOrderRepository.save(order);
        }));
    }

    public Optional<AttentionOrder> updateOrderDuration(Long id, AttentionOrderDTO orderDTO) {
        return getOrderById(id).map(order -> {
            if (order.getFixedDate() == null) {
                order.setDuration(orderDTO.getDuration());
                return attentionOrderRepository.save(order);
            }
            return null;
        });
    }
}
