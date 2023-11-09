package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import com.chiletel.usermanagementservice.service.TechnicianSpecialtyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/technician-specialties")
public class TechnicianSpecialtyController {

    private final TechnicianSpecialtyService technicianSpecialtyService;

    @Autowired
    public TechnicianSpecialtyController(TechnicianSpecialtyService technicianSpecialtyService) {
        this.technicianSpecialtyService = technicianSpecialtyService;
    }

    @GetMapping
    public List<TechnicianSpecialty> getAllTechnicianSpecialties() {
        return technicianSpecialtyService.findAll();
    }

}
