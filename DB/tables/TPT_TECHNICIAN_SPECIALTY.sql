/*******************************************************************************
Description: Table that stores the information of the technician specialitys from technician of CHILETEL
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.TECHNICIAN_SPECIALTY(
    technician_id NUMBER(10) NOT NULL,
    damage_id NUMBER(10) NOT NULL,
    CONSTRAINT fk_technician_specialty_technician FOREIGN KEY (technician_id) REFERENCES TPT_USER_DBA.TECHNICIAN(technician_id),
    CONSTRAINT fk_technician_specialty_damage FOREIGN KEY (damage_id) REFERENCES TPT_USER_DBA.DAMAGE(damage_id)
);

-- Table
COMMENT ON TABLE TPT_USER_DBA.TECHNICIAN_SPECIALTY IS 'CHILETEL Technician Specialties table'
/
