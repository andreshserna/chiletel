/*******************************************************************************
Description: Primary Key for the attention order table.
Author: Andres Mauricio Hernandez Serna
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.ATTENTION_ORDER
ADD CONSTRAINT pk_attention_order PRIMARY KEY (order_id);
