package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.Technician;
import com.chiletel.usermanagementservice.repository.TechnicianRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TechnicianService {

    private final TechnicianRepository technicianRepository;

    @Autowired
    public TechnicianService(TechnicianRepository technicianRepository) {
        this.technicianRepository = technicianRepository;
    }

    public List<Technician> getAllTechnicians() {
        return technicianRepository.findAll();
    }

    public Optional<Technician> getTechnicianById(Long id) {
        return technicianRepository.findById(id);
    }

    public Technician saveTechnician(Technician technician) {
        return technicianRepository.save(technician);
    }

    public void deleteTechnician(Long id) {
        technicianRepository.deleteById(id);
    }
}
