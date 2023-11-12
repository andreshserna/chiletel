package com.chiletel.schedulingservice.controller;

import com.chiletel.schedulingservice.dto.TechnicianDTO;
import com.chiletel.schedulingservice.mapper.TechnicianMapper;
import com.chiletel.schedulingservice.model.Technician;
import com.chiletel.schedulingservice.service.TechnicianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/scheduling-service/technicians")
public class TechnicianController {

    private final TechnicianService technicianService;

    @Autowired
    public TechnicianController(TechnicianService technicianService) {
        this.technicianService = technicianService;
    }

    @GetMapping
    public List<TechnicianDTO> getAllTechnicians() {
        return technicianService.getAllTechnicians().stream()
                .map(TechnicianMapper::technicianToTechnicianDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<TechnicianDTO> getTechnicianById(@PathVariable Long id) {
        return technicianService.getTechnicianById(id)
                .map(technician -> ResponseEntity.ok(TechnicianMapper.technicianToTechnicianDTO(technician)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public TechnicianDTO createTechnician(@RequestBody TechnicianDTO technicianDTO) {
        Technician technician = technicianService.saveTechnician(TechnicianMapper.technicianDTOToTechnician(technicianDTO));
        return TechnicianMapper.technicianToTechnicianDTO(technician);
    }

    @PutMapping("/{id}")
    public ResponseEntity<TechnicianDTO> updateTechnician(@PathVariable Long id, @RequestBody TechnicianDTO technicianDTO) {
        return technicianService.getTechnicianById(id)
                .map(technician -> {
                    Technician updatedTechnician = TechnicianMapper.technicianDTOToTechnician(technicianDTO);
                    updatedTechnician.setTechnicianId(id); // Ensure the ID is set correctly for the update
                    updatedTechnician = technicianService.saveTechnician(updatedTechnician);
                    return ResponseEntity.ok(TechnicianMapper.technicianToTechnicianDTO(updatedTechnician));
                })
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTechnician(@PathVariable Long id) {
        technicianService.deleteTechnician(id);
        return ResponseEntity.ok().build();
    }
}
