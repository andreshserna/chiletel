/*******************************************************************************
Description: Table that stores the information of the bank's branches
Author: Team B
Date: 25-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.BANK_BRANCH(
    bank_branch_id NUMBER(10),
    branch_name VARCHAR2(50),
    address VARCHAR2(100),
    phone_number VARCHAR2(20),
    is_digital NUMBER(1,0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) TABLESPACE TS_MANAGER;

-- Table
COMMENT ON TABLE TPT_USER_DBA.CUSTOMER IS 'Bank branch table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.bank_branch_id IS 'Unique identifier for each bank branch.'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.branch_name IS 'Name of the bank branch. Mandatory field.'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.address IS 'Address of the bank branch'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.phone_number IS 'Phone number of the bank branch'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.is_digital IS 'Sets true if the branch is digital or false if the branch is physical'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.created_at IS 'Date when the bank branch record was created'
/
COMMENT ON COLUMN TPT_USER_DBA.BANK_BRANCH.updated_at IS 'Date when the bank branch record was last updated'
/
