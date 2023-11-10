package com.chiletel.usermanagementservice.service;

import com.chiletel.usermanagementservice.model.Crew;
import javax.persistence.EntityNotFoundException;
import com.chiletel.usermanagementservice.repository.CrewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CrewService {

    private final CrewRepository crewRepository;

    @Autowired
    public CrewService(CrewRepository crewRepository) {
        this.crewRepository = crewRepository;
    }

    public List<Crew> getAllCrews() {
        return crewRepository.findAll();
    }

    public Optional<Crew> getCrewById(Long id) {
        return crewRepository.findById(id);
    }

    public Crew saveCrew(Crew crew) {
        return crewRepository.save(crew);
    }
    
    public Crew updateCrew(Long id, Crew crewDetails) {
        return crewRepository.findById(id).map(crew -> {
            crew.setName(crewDetails.getName());
            crew.setZone(crewDetails.getZone());
            return crewRepository.save(crew);
        }).orElseThrow(() -> new EntityNotFoundException("Crew not found for this id :: " + id));
    }


    
}
