/*******************************************************************************
Description:  Foreign Key from technician specialty table to damage type table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.TECHNICIAN_SPECIALTY
ADD CONSTRAINT fk_technician_specialty_damage FOREIGN KEY (damage_id) REFERENCES APP_ATEN_DANOS.DAMAGE(damage_id);
