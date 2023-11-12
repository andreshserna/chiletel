package com.chiletel.damageorderservice.mapper;

import com.chiletel.damageorderservice.dto.AttentionOrderDTO;
import com.chiletel.damageorderservice.model.AttentionOrder;
import com.chiletel.damageorderservice.model.Customer;
import com.chiletel.damageorderservice.model.Damage;
import com.chiletel.damageorderservice.model.Technician;

public class AttentionOrderMapper {

    public static AttentionOrderDTO toDTO(AttentionOrder order) {
        AttentionOrderDTO dto = new AttentionOrderDTO();
        dto.setOrderId(order.getOrderId());
        dto.setOrderDescription(order.getOrderDescription());
        dto.setReportDate(order.getReportDate());
        dto.setCustomerId(order.getCustomer() != null ? order.getCustomer().getCustomerId() : null);
        dto.setDamageId(order.getDamage() != null ? order.getDamage().getDamageId() : null);
        dto.setTechnicianId(order.getTechnician() != null ? order.getTechnician().getTechnicianId() : null);
        dto.setDuration(order.getDuration());
        dto.setFixedDate(order.getFixedDate());
        return dto;
    }

    public static AttentionOrder toEntity(AttentionOrderDTO dto) {
        AttentionOrder order = new AttentionOrder();
        // Removed setting orderId for new order creation
        order.setOrderDescription(dto.getOrderDescription());
        order.setReportDate(dto.getReportDate());

        if (dto.getCustomerId() != null) {
            Customer customer = new Customer();
            customer.setCustomerId(dto.getCustomerId());
            order.setCustomer(customer);
        }

        if (dto.getDamageId() != null) {
            Damage damage = new Damage();
            damage.setDamageId(dto.getDamageId());
            order.setDamage(damage);
        }

        if (dto.getTechnicianId() != null) {
            Technician technician = new Technician();
            technician.setTechnicianId(dto.getTechnicianId());
            order.setTechnician(technician);
        }

        order.setDuration(dto.getDuration());
        order.setFixedDate(dto.getFixedDate());
        return order;
    }
}
