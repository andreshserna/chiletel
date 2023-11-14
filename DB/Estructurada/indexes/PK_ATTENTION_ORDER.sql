/*******************************************************************************
Description: Primary Key for the attention order table.
Author: Andres Mauricio Hernandez Serna
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE APP_ATEN_DANOS.ATTENTION_ORDER
ADD CONSTRAINT pk_attention_order PRIMARY KEY (order_id);
