package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.dto.CrewDTO;
import com.chiletel.usermanagementservice.mapper.CrewMapper;
import com.chiletel.usermanagementservice.model.Crew;
import com.chiletel.usermanagementservice.service.CrewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/user-management/crews")
public class CrewController {

    private final CrewService crewService;

    @Autowired
    public CrewController(CrewService crewService) {
        this.crewService = crewService;
    }

    @GetMapping
    public List<CrewDTO> getAllCrews() {
        return crewService.getAllCrews().stream()
                .map(CrewMapper::crewToCrewDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CrewDTO> getCrewById(@PathVariable Long id) {
        Crew crew = crewService.getCrewById(id)
                .orElse(null);
        if (crew == null) {
            return ResponseEntity.notFound().build();
        }
        CrewDTO crewDTO = CrewMapper.crewToCrewDTO(crew);
        return ResponseEntity.ok(crewDTO);
    }

    @PostMapping
    public ResponseEntity<CrewDTO> createCrew(@RequestBody CrewDTO crewDTO) {
        Crew crew = CrewMapper.crewDTOToCrew(crewDTO);
        Crew savedCrew = crewService.saveCrew(crew);
        CrewDTO savedCrewDTO = CrewMapper.crewToCrewDTO(savedCrew);
        return ResponseEntity.ok(savedCrewDTO);
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateCrew(@PathVariable Long id, @RequestBody CrewDTO crewDTO) {
        return crewService.getCrewById(id).map(existingCrew -> {
            existingCrew.setName(crewDTO.getName());
            existingCrew.setZone(crewDTO.getZone());
            Crew savedCrew = crewService.saveCrew(existingCrew);
            CrewDTO savedCrewDTO = CrewMapper.crewToCrewDTO(savedCrew);
            return ResponseEntity.ok(savedCrewDTO);
        }).orElse(ResponseEntity.notFound().build());
    }
}
