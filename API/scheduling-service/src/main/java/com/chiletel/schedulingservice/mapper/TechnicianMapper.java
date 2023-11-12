package com.chiletel.schedulingservice.mapper;

import com.chiletel.schedulingservice.dto.TechnicianDTO;
import com.chiletel.schedulingservice.model.Technician;

public class TechnicianMapper {

    public static TechnicianDTO technicianToTechnicianDTO(Technician technician) {
        if (technician == null) {
            return null;
        }

        TechnicianDTO technicianDTO = new TechnicianDTO();
        technicianDTO.setTechnicianId(technician.getTechnicianId());
        technicianDTO.setName(technician.getName());
        technicianDTO.setDocument(technician.getDocument());
        technicianDTO.setDocumentType(technician.getDocumentType());
        technicianDTO.setCrewId(technician.getCrew().getCrewId());

        return technicianDTO;
    }

    public static Technician technicianDTOToTechnician(TechnicianDTO technicianDTO) {
        if (technicianDTO == null) {
            return null;
        }

        Technician technician = new Technician();
        technician.setTechnicianId(technicianDTO.getTechnicianId());
        technician.setName(technicianDTO.getName());
        technician.setDocument(technicianDTO.getDocument());
        technician.setDocumentType(technicianDTO.getDocumentType());

        return technician;
    }
    
}
