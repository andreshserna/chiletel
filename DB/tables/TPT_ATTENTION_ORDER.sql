/*******************************************************************************
Description: Table that stores the attention orders for reported damages by CHILETEL customers.
Author: Andres Mauricio Hernandez Serna
Date: 22-09-23
Management_id: XD02
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE APP_ATEN_DANOS.ATTENTION_ORDER(	"ORDER_DESCRIPTION" VARCHAR2(200), 
	"REPORT_DATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"DAMAGE_ID" NUMBER(10,0) NOT NULL ENABLE, 
	"TECHNICIAN_ID" NUMBER(10,0), 
	"DURATION" INTERVAL DAY (2) TO SECOND (6), 
	"FIXED_DATE" DATE, 
	"ORDER_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  NOT NULL ENABLE
   );

-- Table
COMMENT ON TABLE APP_ATEN_DANOS.ATTENTION_ORDER IS 'CHILETEL Attention Order table'
/

-- Columns
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.order_id IS 'Unique identifier for each attention order.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.report_date IS 'Date when the damage was reported by the customer.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.customer_id IS 'Reference to the customer who reported the damage.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.damage_id IS 'Reference to the type of damage reported.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.technician_id IS 'Reference to the technician assigned to fix the damage. Can be NULL if no technician is assigned yet.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.duration IS 'Estimated duration to fix the damage.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.fixed_date IS 'Date when the damage was fixed.'
/
COMMENT ON COLUMN APP_ATEN_DANOS.ATTENTION_ORDER.ORDER_DESCRIPTION IS 'Description of the damage from the Order.'
/