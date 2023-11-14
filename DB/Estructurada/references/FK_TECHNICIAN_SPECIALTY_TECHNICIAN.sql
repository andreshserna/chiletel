/*******************************************************************************
Description: Foreign Key from attention order table to technician table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.TECHNICIAN_SPECIALTY
ADD CONSTRAINT fk_technician_specialty_technician FOREIGN KEY (technician_id) REFERENCES APP_ATEN_DANOS.TECHNICIAN(technician_id);


-- no puedes tener una especialidad listada para un técnico que no exista en la tabla TECHNICIAN.