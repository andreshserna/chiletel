package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import com.chiletel.usermanagementservice.repository.TechnicianSpecialtyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TechnicianSpecialtyService {

    private final TechnicianSpecialtyRepository technicianSpecialtyRepository;

    @Autowired
    public TechnicianSpecialtyService(TechnicianSpecialtyRepository technicianSpecialtyRepository) {
        this.technicianSpecialtyRepository = technicianSpecialtyRepository;
    }

    public TechnicianSpecialty saveTechnicianSpecialty(TechnicianSpecialty technicianSpecialty) {
        return technicianSpecialtyRepository.save(technicianSpecialty);
    }
}
