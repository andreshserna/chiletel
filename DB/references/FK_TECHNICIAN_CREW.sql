/*******************************************************************************
Description: Foreign Key from technician table to crew table.
Author: Andres Mauricio Hernandez Serna
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.TECHNICIAN
ADD CONSTRAINT fk_technician_crew FOREIGN KEY (crew_id) REFERENCES TPT_USER_DBA.CREW(crew_id);
