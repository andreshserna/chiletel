package com.chiletel.usermanagementservice.mapper;

import com.chiletel.usermanagementservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import com.chiletel.usermanagementservice.model.TechnicianSpecialtyId;

public class TechnicianSpecialtyMapper {

    public static TechnicianSpecialtyDTO toTechnicianSpecialtyDTO(TechnicianSpecialty technicianSpecialty) {
        TechnicianSpecialtyDTO dto = new TechnicianSpecialtyDTO();
        if (technicianSpecialty != null && technicianSpecialty.getId() != null) {
            dto.setTechnicianId(technicianSpecialty.getId().getTechnicianId());
            dto.setDamageId(technicianSpecialty.getId().getDamageId());
        }
        return dto;
    }

    public static TechnicianSpecialty toTechnicianSpecialty(TechnicianSpecialtyDTO dto) {
        TechnicianSpecialty technicianSpecialty = new TechnicianSpecialty();
        if (dto != null) {
            TechnicianSpecialtyId id = new TechnicianSpecialtyId(dto.getTechnicianId(), dto.getDamageId());
            technicianSpecialty.setId(id);
        }
        return technicianSpecialty;
    }
}
