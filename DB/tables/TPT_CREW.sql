/*******************************************************************************
Description: Table that stores the information of CHILETEL crews of technicians.
Author: Andres Mauricio Hernandez Serna
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE APP_ATEN_DANOS.CREW(
    crew_id NUMBER(10) NOT NULL,
    name VARCHAR2(80) NOT NULL,
    zone VARCHAR2(50) NOT NULL
);

-- Table
COMMENT ON TABLE APP_ATEN_DANOS.CREW IS 'CHILETEL Crews table'
/

-- Columns
COMMENT ON COLUMN APP_ATEN_DANOS.CREW.crew_id IS 'Unique identifier for each crew.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.CREW.name IS 'Name of the crew.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.CREW.zone IS 'Zone or district the crew operates in.'
/
