/*******************************************************************************
Description: Table that stores the information of CHILETEL customers.
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.CUSTOMER(
    customer_id NUMBER(10) NOT NULL,
    name VARCHAR2(80) NOT NULL,
    address VARCHAR2(100) NOT NULL,
    district VARCHAR2(50) NOT NULL,
    type NUMBER(1) NOT NULL CHECK (type BETWEEN 1 AND 5), -- Assuming 5 types with 5 being the most important and 1 being the most common
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table
COMMENT ON TABLE TPT_USER_DBA.CUSTOMER IS 'CHILETEL Customer table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.customer_id IS 'Unique identifier for each CHILETEL customer.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.name IS 'Name of the CHILETEL customer. Mandatory field.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.address IS 'Address of the CHILETEL customer.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.district IS 'District of the CHILETEL customer.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.type IS 'Type of the CHILETEL customer. 5 being the most important and 1 being the most common.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.created_at IS 'Date when the CHILETEL customer record was created.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.updated_at IS 'Date when the CHILETEL customer record was last updated.'
/
