package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.model.Damage;
import com.chiletel.usermanagementservice.service.DamageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/damages")
public class DamageController {

    private final DamageService damageService;

    @Autowired
    public DamageController(DamageService damageService) {
        this.damageService = damageService;
    }

    @GetMapping
    public List<Damage> getAllDamages() {
        return damageService.findAll();
    }

}
