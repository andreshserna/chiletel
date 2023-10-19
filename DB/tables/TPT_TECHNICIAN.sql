/*******************************************************************************
Description: Table that stores the information of the technicians of CHILETEL
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.TECHNICIAN(
    technician_id NUMBER(10) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    document VARCHAR2(20) NOT NULL,
    document_type VARCHAR2(20) NOT NULL,
    crew_id NUMBER(10) NOT NULL
);

-- Table
COMMENT ON TABLE TPT_USER_DBA.TECHNICIAN IS 'CHILETEL Technicians table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.TECHNICIAN.technician_id IS 'Unique identifier for each technician.'
/
COMMENT ON COLUMN TPT_USER_DBA.TECHNICIAN.name IS 'Name of the technician.'
/
COMMENT ON COLUMN TPT_USER_DBA.TECHNICIAN.document IS 'Document number of the technician.'
/
COMMENT ON COLUMN TPT_USER_DBA.TECHNICIAN.document_type IS 'Type of document of the technician.'
/
COMMENT ON COLUMN TPT_USER_DBA.TECHNICIAN.crew_id IS 'Reference to the crew the technician belongs to.'
/
