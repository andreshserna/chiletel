/*******************************************************************************
Description: Foreign Key from attention order table to technician table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.ATTENTION_ORDER
ADD CONSTRAINT fk_attention_order_technician FOREIGN KEY (technician_id) REFERENCES TPT_USER_DBA.TECHNICIAN(technician_id);
