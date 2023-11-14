package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.Damage;
import com.chiletel.usermanagementservice.repository.DamageRepository;
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

    public List<Damage> findAll() {
        return damageRepository.findAll();
    }
    
    public Optional<Damage> findById(Long id) {
        return damageRepository.findById(id);
    }

}
