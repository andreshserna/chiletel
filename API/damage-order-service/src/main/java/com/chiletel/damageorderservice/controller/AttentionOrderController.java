package com.chiletel.damageorderservice.controller;

import com.chiletel.damageorderservice.dto.AttentionOrderDTO;
import com.chiletel.damageorderservice.dto.TechnicianAssignmentDTO;
import com.chiletel.damageorderservice.mapper.AttentionOrderMapper;
import com.chiletel.damageorderservice.model.AttentionOrder;
import com.chiletel.damageorderservice.service.AttentionOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/damage-order/attention-orders")
public class AttentionOrderController {

    private final AttentionOrderService attentionOrderService;

    @Autowired
    public AttentionOrderController(AttentionOrderService attentionOrderService) {
        this.attentionOrderService = attentionOrderService;
    }

    @GetMapping
    public List<AttentionOrderDTO> getAllOrders() {
        return attentionOrderService.getAllOrders().stream()
                .map(AttentionOrderMapper::toDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<AttentionOrderDTO> getOrderById(@PathVariable Long id) {
        return attentionOrderService.getOrderById(id)
                .map(order -> ResponseEntity.ok(AttentionOrderMapper.toDTO(order)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
    
    @GetMapping("/customer/{customerId}")
    public List<AttentionOrderDTO> getOrdersByCustomerId(@PathVariable Long customerId) {
        return attentionOrderService.getOrdersByCustomerId(customerId).stream()
                .map(AttentionOrderMapper::toDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/technician/{technicianId}")
    public List<AttentionOrderDTO> getOrdersByTechnicianId(@PathVariable Long technicianId) {
        return attentionOrderService.getOrdersByTechnicianId(technicianId).stream()
                .map(AttentionOrderMapper::toDTO)
                .collect(Collectors.toList());
    }
    
    @GetMapping("/unassigned")
    public List<AttentionOrderDTO> getUnassignedOrders() {
        return attentionOrderService.getUnassignedOrders().stream()
            .map(AttentionOrderMapper::toDTO)
            .collect(Collectors.toList());
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<AttentionOrderDTO> updateOrderDuration(@PathVariable Long id, @RequestBody AttentionOrderDTO orderDTO) {
        return attentionOrderService.updateOrderDuration(id, orderDTO)
                .map(order -> ResponseEntity.ok(AttentionOrderMapper.toDTO(order)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
    
    @PutMapping("/{id}/assign-technician")
    public ResponseEntity<AttentionOrderDTO> assignTechnicianToOrder(@PathVariable Long id, @RequestBody TechnicianAssignmentDTO assignmentDTO) {
        return attentionOrderService.assignTechnician(id, assignmentDTO.getTechnicianId())
                .map(order -> ResponseEntity.ok(AttentionOrderMapper.toDTO(order)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }



    @PostMapping
    public AttentionOrderDTO createOrder(@RequestBody AttentionOrderDTO orderDTO) {
        AttentionOrder order = AttentionOrderMapper.toEntity(orderDTO);
        order = attentionOrderService.saveOrder(order);
        return AttentionOrderMapper.toDTO(order);
    }
}
