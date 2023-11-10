package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.usermanagementservice.mapper.TechnicianSpecialtyMapper;
import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import com.chiletel.usermanagementservice.service.TechnicianSpecialtyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/technician-specialties")
public class TechnicianSpecialtyController {

    private final TechnicianSpecialtyService technicianSpecialtyService;

    @Autowired
    public TechnicianSpecialtyController(TechnicianSpecialtyService technicianSpecialtyService) {
        this.technicianSpecialtyService = technicianSpecialtyService;
    }

    @PostMapping
    public ResponseEntity<TechnicianSpecialtyDTO> createTechnicianSpecialty(@RequestBody TechnicianSpecialtyDTO technicianSpecialtyDTO) {
        TechnicianSpecialty technicianSpecialty = TechnicianSpecialtyMapper.toTechnicianSpecialty(technicianSpecialtyDTO);
        TechnicianSpecialty savedTechnicianSpecialty = technicianSpecialtyService.saveTechnicianSpecialty(technicianSpecialty);
        TechnicianSpecialtyDTO savedTechnicianSpecialtyDTO = TechnicianSpecialtyMapper.toTechnicianSpecialtyDTO(savedTechnicianSpecialty);
        return ResponseEntity.ok(savedTechnicianSpecialtyDTO);
    }
}
