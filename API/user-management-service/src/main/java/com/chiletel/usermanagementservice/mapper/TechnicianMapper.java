package com.chiletel.usermanagementservice.mapper;

import com.chiletel.usermanagementservice.dto.TechnicianDTO;
import com.chiletel.usermanagementservice.model.Crew;
import com.chiletel.usermanagementservice.model.Technician;
import com.chiletel.usermanagementservice.repository.CrewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.EntityNotFoundException;

@Component
public class TechnicianMapper {

    private final CrewRepository crewRepository;

    @Autowired
    public TechnicianMapper(CrewRepository crewRepository) {
        this.crewRepository = crewRepository;
    }

    public TechnicianDTO technicianToTechnicianDTO(Technician technician) {
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

    public Technician technicianDTOToTechnician(TechnicianDTO technicianDTO) {
        if (technicianDTO == null) {
            return null;
        }

        Technician technician = new Technician();
        technician.setTechnicianId(technicianDTO.getTechnicianId());
        technician.setName(technicianDTO.getName());
        technician.setDocument(technicianDTO.getDocument());
        technician.setDocumentType(technicianDTO.getDocumentType());

        Crew crew = crewRepository.findById(technicianDTO.getCrewId())
                .orElseThrow(() -> new EntityNotFoundException("Crew not found with id: " + technicianDTO.getCrewId()));
        technician.setCrew(crew);

        return technician;
    }
}
