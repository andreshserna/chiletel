package com.chiletel.schedulingservice.mapper;

import com.chiletel.schedulingservice.dto.CrewDTO;
import com.chiletel.schedulingservice.model.Crew;

public class CrewMapper {

    public static CrewDTO crewToCrewDTO(Crew crew) {
        if (crew == null) {
            return null;
        }

        CrewDTO crewDTO = new CrewDTO();
        crewDTO.setCrewId(crew.getCrewId());
        crewDTO.setName(crew.getName());
        crewDTO.setZone(crew.getZone());

        return crewDTO;
    }

    public static Crew crewDTOToCrew(CrewDTO crewDTO) {
        if (crewDTO == null) {
            return null;
        }

        Crew crew = new Crew();
        crew.setCrewId(crewDTO.getCrewId());
        crew.setName(crewDTO.getName());
        crew.setZone(crewDTO.getZone());

        return crew;
    }
}
