/*******************************************************************************
Description: Foreign Key from technician table to crew table.
Author: Andres Mauricio Hernandez Serna
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.TECHNICIAN
ADD CONSTRAINT fk_technician_crew FOREIGN KEY (crew_id) REFERENCES APP_ATEN_DANOS.CREW(crew_id);
