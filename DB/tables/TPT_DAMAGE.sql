/*******************************************************************************
Description: Table that stores the information of DAMAGES inside the CHILETEL consumers structure.
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.DAMAGE(
    damage_id NUMBER(10) NOT NULL,
    description VARCHAR2(200) NOT NULL,
    priority NUMBER(1) NOT NULL CHECK (priority BETWEEN 1 AND 5), -- Assuming 5 levels of priority with 5 being the most urgent
    estimated_duration INTERVAL DAY TO SECOND
);

-- Table
COMMENT ON TABLE TPT_USER_DBA.DAMAGE IS 'CHILETEL Damage Types table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.DAMAGE.damage_id IS 'Unique identifier for each damage type.'
/
COMMENT ON COLUMN TPT_USER_DBA.DAMAGE.description IS 'Description of the damage type.'
/
COMMENT ON COLUMN TPT_USER_DBA.DAMAGE.priority IS 'Priority level of the damage. 5 being the most urgent.'
/
COMMENT ON COLUMN TPT_USER_DBA.DAMAGE.estimated_duration IS 'Estimated duration to fix the damage.'
/
