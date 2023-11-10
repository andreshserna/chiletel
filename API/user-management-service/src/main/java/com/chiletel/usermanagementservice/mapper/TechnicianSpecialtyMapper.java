package com.chiletel.usermanagementservice.mapper;

import com.chiletel.usermanagementservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.usermanagementservice.model.TechnicianSpecialty;

public class TechnicianSpecialtyMapper {

    public static TechnicianSpecialtyDTO toTechnicianSpecialtyDTO(TechnicianSpecialty technicianSpecialty) {
        TechnicianSpecialtyDTO dto = new TechnicianSpecialtyDTO();
        dto.setTechnicianId(technicianSpecialty.getTechnician().getTechnicianId());
        dto.setDamageId(technicianSpecialty.getDamage().getDamageId());
        return dto;
    }

    public static TechnicianSpecialty toTechnicianSpecialty(TechnicianSpecialtyDTO dto) {
        TechnicianSpecialty technicianSpecialty = new TechnicianSpecialty();
        technicianSpecialty.setTechnicianId(dto.getTechnicianId());
        technicianSpecialty.setDamageId(dto.getDamageId());
        // Note: The actual Technician and Damage objects deben setearse en el layer antes de guardarse
        return technicianSpecialty;
    }
}
