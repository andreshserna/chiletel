/*******************************************************************************
Description: Foreign Key from attention order table to technician table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.TECHNICIAN_SPECIALTY
ADD CONSTRAINT fk_technician_specialty_technician FOREIGN KEY (technician_id) REFERENCES TPT_USER_DBA.TECHNICIAN(technician_id);


-- no puedes tener una especialidad listada para un técnico que no exista en la tabla TECHNICIAN.