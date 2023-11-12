package com.chiletel.damageorderservice.controller;

import com.chiletel.damageorderservice.dto.DamageDTO;
import com.chiletel.damageorderservice.mapper.DamageMapper;
import com.chiletel.damageorderservice.model.Damage;
import com.chiletel.damageorderservice.service.DamageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/damage-order/damages")
public class DamageController {

    private final DamageService damageService;

    @Autowired
    public DamageController(DamageService damageService) {
        this.damageService = damageService;
    }

    @GetMapping
    public List<DamageDTO> getAllDamages() {
        return damageService.getAllDamages().stream()
                .map(DamageMapper::toDTO)
                .collect(Collectors.toList());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DamageDTO> getDamageById(@PathVariable Long id) {
        return damageService.getDamageById(id)
                .map(damage -> ResponseEntity.ok(DamageMapper.toDTO(damage)))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public DamageDTO createDamage(@RequestBody DamageDTO damageDTO) {
        Damage damage = DamageMapper.toEntity(damageDTO);
        damage = damageService.saveDamage(damage);
        return DamageMapper.toDTO(damage);
    }

    
}
