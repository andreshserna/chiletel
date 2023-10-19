/*******************************************************************************
Description: Foreign Key from attention order table to customer table.
Author: Andres Mauricio Hernandez Serna
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.ATTENTION_ORDER
ADD CONSTRAINT fk_attention_order_customer FOREIGN KEY (customer_id) REFERENCES TPT_USER_DBA.CUSTOMER(customer_id);
