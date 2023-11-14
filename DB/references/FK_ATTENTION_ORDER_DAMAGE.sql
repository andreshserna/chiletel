/*******************************************************************************
Description:  Foreign Key from attention order table to damage type table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.ATTENTION_ORDER
ADD CONSTRAINT fk_attention_order_damage FOREIGN KEY (damage_id) REFERENCES APP_ATEN_DANOS.DAMAGE(damage_id);
