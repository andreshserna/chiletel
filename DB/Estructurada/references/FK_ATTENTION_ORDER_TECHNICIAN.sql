/*******************************************************************************
Description: Foreign Key from attention order table to technician table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.ATTENTION_ORDER
ADD CONSTRAINT fk_attention_order_technician FOREIGN KEY (technician_id) REFERENCES APP_ATEN_DANOS.TECHNICIAN(technician_id);
