package com.chiletel.damageorderservice.service;

import com.chiletel.damageorderservice.model.AttentionOrder;
import com.chiletel.damageorderservice.repository.AttentionOrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AttentionOrderService {

    private final AttentionOrderRepository attentionOrderRepository;

    @Autowired
    public AttentionOrderService(AttentionOrderRepository attentionOrderRepository) {
        this.attentionOrderRepository = attentionOrderRepository;
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

    // Since DELETE operations are not required, they are not included
}