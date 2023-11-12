package com.chiletel.damageorderservice.mapper;

import com.chiletel.damageorderservice.dto.DamageDTO;
import com.chiletel.damageorderservice.model.Damage;

public class DamageMapper {

    public static DamageDTO toDTO(Damage damage) {
        DamageDTO dto = new DamageDTO();
        dto.setDamageId(damage.getDamageId());
        dto.setDescription(damage.getDescription());
        dto.setPriority(damage.getPriority());
        dto.setEstimatedDuration(damage.getEstimatedDuration());
        return dto;
    }

    public static Damage toEntity(DamageDTO dto) {
        Damage damage = new Damage();
        damage.setDamageId(dto.getDamageId());
        damage.setDescription(dto.getDescription());
        damage.setPriority(dto.getPriority());
        damage.setEstimatedDuration(dto.getEstimatedDuration());
        return damage;
    }
}
