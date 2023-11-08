package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.model.Crew;
import com.chiletel.usermanagementservice.service.CrewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/crews")
public class CrewController {

    private final CrewService crewService;

    @Autowired
    public CrewController(CrewService crewService) {
        this.crewService = crewService;
    }

    @GetMapping
    public List<Crew> getAllCrews() {
        return crewService.getAllCrews();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Crew> getCrewById(@PathVariable Long id) {
        return crewService.getCrewById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Crew createCrew(@RequestBody Crew crew) {
        return crewService.saveCrew(crew);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Crew> updateCrew(@PathVariable Long id, @RequestBody Crew crew) {
        // Update logic here
        return ResponseEntity.ok(crewService.saveCrew(crew));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCrew(@PathVariable Long id) {
        crewService.deleteCrew(id);
        return ResponseEntity.ok().build();
    }

    // Additional endpoints for managing crews
}
