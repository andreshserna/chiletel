package com.chiletel.usermanagementservice.repository;

import com.chiletel.usermanagementservice.model.Damage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DamageRepository extends JpaRepository<Damage, Long> {
    // Aquí puedes agregar métodos personalizados si los necesitas
}
