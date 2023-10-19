/*******************************************************************************
Description: Table that stores the attention orders for reported damages by CHILETEL customers.
Author: Team B
Date: 22-09-23
Management_id: XD02
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.ATTENTION_ORDER(
    order_id NUMBER(10) NOT NULL,
    order_description VARCHAR2(200),
    report_date DATE NOT NULL DEFAULT SYSDATE,
    customer_id NUMBER(10) NOT NULL,
    damage_id NUMBER(10) NOT NULL,
    technician_id NUMBER(10),
    duration INTERVAL DAY TO SECOND,
    fixed_date DATE,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES TPT_USER_DBA.CUSTOMER(customer_id),
    -- Assuming there are tables for Damage and Technician, you might want to add foreign keys for them as well.
    -- CONSTRAINT fk_damage FOREIGN KEY (damage_id) REFERENCES TPT_USER_DBA.DAMAGE(damage_id),
    -- CONSTRAINT fk_technician FOREIGN KEY (technician_id) REFERENCES TPT_USER_DBA.TECHNICIAN(technician_id)
);

-- Table
COMMENT ON TABLE TPT_USER_DBA.ATTENTION_ORDER IS 'CHILETEL Attention Order table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.order_id IS 'Unique identifier for each attention order.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.report_date IS 'Date when the damage was reported by the customer.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.customer_id IS 'Reference to the customer who reported the damage.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.damage_id IS 'Reference to the type of damage reported.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.technician_id IS 'Reference to the technician assigned to fix the damage. Can be NULL if no technician is assigned yet.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.duration IS 'Estimated duration to fix the damage.'
/
COMMENT ON COLUMN TPT_USER_DBA.ATTENTION_ORDER.fixed_date IS 'Date when the damage was fixed.'
/