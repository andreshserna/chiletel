package com.chiletel.schedulingservice.controller;

import com.chiletel.schedulingservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.schedulingservice.mapper.TechnicianSpecialtyMapper;
import com.chiletel.schedulingservice.model.TechnicianSpecialty;
import com.chiletel.schedulingservice.service.TechnicianSpecialtyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/scheduling-service/technician-specialties")
public class TechnicianSpecialtyController {

    private final TechnicianSpecialtyService technicianSpecialtyService;

    @Autowired
    public TechnicianSpecialtyController(TechnicianSpecialtyService technicianSpecialtyService) {
        this.technicianSpecialtyService = technicianSpecialtyService;
    }

    @GetMapping
    public ResponseEntity<List<TechnicianSpecialtyDTO>> getAllTechnicianSpecialties() {
        List<TechnicianSpecialty> specialties = technicianSpecialtyService.findAll();
        List<TechnicianSpecialtyDTO> specialtiesDTO = specialties.stream()
                .map(TechnicianSpecialtyMapper::toTechnicianSpecialtyDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(specialtiesDTO);
    }

    @GetMapping("/{id}")
    public ResponseEntity<TechnicianSpecialtyDTO> getTechnicianSpecialtyById(@PathVariable Long id) {
        Optional<TechnicianSpecialty> specialtyOptional = technicianSpecialtyService.findById(id);
        if (!specialtyOptional.isPresent()) {
            return ResponseEntity.notFound().build();
        }
        TechnicianSpecialtyDTO specialtyDTO = TechnicianSpecialtyMapper.toTechnicianSpecialtyDTO(specialtyOptional.get());
        return ResponseEntity.ok(specialtyDTO);
    }

    @PostMapping
    public ResponseEntity<TechnicianSpecialtyDTO> createTechnicianSpecialty(@RequestBody TechnicianSpecialtyDTO technicianSpecialtyDTO) {
        TechnicianSpecialty technicianSpecialty = TechnicianSpecialtyMapper.toTechnicianSpecialty(technicianSpecialtyDTO);
        TechnicianSpecialty savedTechnicianSpecialty = technicianSpecialtyService.saveTechnicianSpecialty(technicianSpecialty);
        TechnicianSpecialtyDTO savedTechnicianSpecialtyDTO = TechnicianSpecialtyMapper.toTechnicianSpecialtyDTO(savedTechnicianSpecialty);
        return ResponseEntity.ok(savedTechnicianSpecialtyDTO);
    }
}
