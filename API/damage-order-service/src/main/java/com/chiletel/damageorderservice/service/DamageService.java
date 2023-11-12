package com.chiletel.damageorderservice.service;

import com.chiletel.damageorderservice.model.Damage;
import com.chiletel.damageorderservice.repository.DamageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DamageService {

    private final DamageRepository damageRepository;

    @Autowired
    public DamageService(DamageRepository damageRepository) {
        this.damageRepository = damageRepository;
    }

    public List<Damage> getAllDamages() {
        return damageRepository.findAll();
    }

    public Optional<Damage> getDamageById(Long id) {
        return damageRepository.findById(id);
    }

    public Damage saveDamage(Damage damage) {
        return damageRepository.save(damage);
    }
}
