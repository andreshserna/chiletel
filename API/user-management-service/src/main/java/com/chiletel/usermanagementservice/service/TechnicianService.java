package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.Technician;
import com.chiletel.usermanagementservice.repository.TechnicianRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import javax.persistence.EntityNotFoundException;
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

    public boolean deleteTechnician(Long id) {
        if (technicianRepository.existsById(id)) {
            technicianRepository.deleteById(id);
            return true;
        }
        return false;
    }
    
    public boolean existsByDocument(String document) {
        return technicianRepository.existsByDocument(document);
    }
    
    public Technician updateTechnician(Long id, Technician technicianDetails) {
        return technicianRepository.findById(id).map(technician -> {
            technician.setName(technicianDetails.getName());
            technician.setDocument(technicianDetails.getDocument());
            technician.setDocumentType(technicianDetails.getDocumentType());
            // Update other fields as needed
            return technicianRepository.save(technician);
        }).orElseThrow(() -> new EntityNotFoundException("Technician not found for this id :: " + id));
    }


}
