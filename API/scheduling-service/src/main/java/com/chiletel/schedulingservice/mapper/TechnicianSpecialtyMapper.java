package com.chiletel.schedulingservice.mapper;

import com.chiletel.schedulingservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.schedulingservice.model.TechnicianSpecialty;
import com.chiletel.schedulingservice.model.TechnicianSpecialtyId;

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
