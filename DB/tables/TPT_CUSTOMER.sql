/*******************************************************************************
Description: Table that stores the information of the bank's clients
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.CUSTOMER(
    customer_id NUMBER(10),
    first_name VARCHAR2(20) NOT NULL,
    second_name VARCHAR2(20),
    last_name VARCHAR2(20) NOT NULL,
    second_last_name VARCHAR2(20),
    birthdate DATE NOT NULL,
    document VARCHAR2(20) NOT NULL,
    document_type_id NUMBER(2),
    address VARCHAR2(100) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone_number VARCHAR2(20) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) TABLESPACE TS_MANAGER;

-- Table
COMMENT ON TABLE TPT_USER_DBA.CUSTOMER IS 'Customer table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.customer_id IS 'Unique identifier for each customer.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.first_name IS 'First name of the customer. Mandatory field.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.second_name IS 'Second name of the customer. Optional field.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.last_name IS 'Last name of the customer. Mandatory field.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.second_last_name IS 'Second last name of the customer. Optional field.'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.birthdate IS 'Birthdate of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.document IS 'Document number of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.document_type IS 'Type of document of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.address IS 'Address of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.email IS 'Email of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.phone_number IS 'Phone number of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.password IS 'Password of the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.created_at IS 'Date when the customers record was created'
/
COMMENT ON COLUMN TPT_USER_DBA.CUSTOMER.updated_at IS 'Date when the customers record was last updated'
/
