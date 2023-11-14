package com.chiletel.usermanagementservice.controller;

import com.chiletel.usermanagementservice.dto.TechnicianSpecialtyDTO;
import com.chiletel.usermanagementservice.mapper.TechnicianSpecialtyMapper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.chiletel.usermanagementservice.model.TechnicianSpecialty;
import com.chiletel.usermanagementservice.model.TechnicianSpecialtyId;
import com.chiletel.usermanagementservice.service.TechnicianSpecialtyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/user-management/technician-specialties")
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
    
    @GetMapping("/{id}/specialties")
    public ResponseEntity<List<TechnicianSpecialtyDTO>> getTechnicianSpecialtiesById(@PathVariable Long id) {
        List<TechnicianSpecialty> specialties = technicianSpecialtyService.findSpecialtiesByTechnicianId(id);
        if (specialties.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        List<TechnicianSpecialtyDTO> specialtiesDTO = specialties.stream()
                .map(TechnicianSpecialtyMapper::toTechnicianSpecialtyDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(specialtiesDTO);
    }


    @PostMapping
    public ResponseEntity<TechnicianSpecialtyDTO> createTechnicianSpecialty(@RequestBody TechnicianSpecialtyDTO technicianSpecialtyDTO) {
        TechnicianSpecialty technicianSpecialty = TechnicianSpecialtyMapper.toTechnicianSpecialty(technicianSpecialtyDTO);
        TechnicianSpecialty savedTechnicianSpecialty = technicianSpecialtyService.saveTechnicianSpecialty(technicianSpecialty);
        TechnicianSpecialtyDTO savedTechnicianSpecialtyDTO = TechnicianSpecialtyMapper.toTechnicianSpecialtyDTO(savedTechnicianSpecialty);
        return ResponseEntity.ok(savedTechnicianSpecialtyDTO);
    }
    
    @PostMapping("/execute-sql-script")
    public ResponseEntity<String> executeSqlScript(@RequestParam("technicianId") Long technicianId, @RequestParam("damageId") Long damageId) {
        String sqlScript = "INSERT INTO TECHNICIAN_SPECIALTY (TECHNICIAN_ID, DAMAGE_ID) VALUES (?, ?)";
        
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XEPDB1", "APP_ATEN_DANOS", "oracle");
            
            PreparedStatement preparedStatement = connection.prepareStatement(sqlScript);
            preparedStatement.setLong(1, technicianId);
            preparedStatement.setLong(2, damageId);
            
            preparedStatement.executeUpdate();
            
            connection.close();
            
            return ResponseEntity.ok("Script SQL ejecutado con éxito");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al cargar el controlador JDBC de Oracle");
        } catch (SQLException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al ejecutar el script SQL");
        }
    }


}
