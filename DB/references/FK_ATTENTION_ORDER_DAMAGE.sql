/*******************************************************************************
Description:  Foreign Key from attention order table to damage type table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.ATTENTION_ORDER
ADD CONSTRAINT fk_attention_order_damage FOREIGN KEY (damage_id) REFERENCES TPT_USER_DBA.DAMAGE(damage_id);
