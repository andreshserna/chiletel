/*******************************************************************************
Description: Table that stores the information of customer's account
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.ACCOUNT (
    account_id NUMBER(10),
    customer_id NUMBER(10),
    account_type_id NUMBER(10),
    created_branch_id NUMBER(10),
    balance NUMBER(15) DEFAULT NULL,
    password VARCHAR2(4) NOT NULL,
    closing_date TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) TABLESPACE TS_MANAGER;

-- Table
COMMENT ON TABLE TPT_USER_DBA.ACCOUNT IS 'Account table'
/

-- Columns
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.account_id IS 'Unique identifier for each account'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.customer_id IS 'Unique identifier for the customer'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.account_type_id IS 'Unique identifier for the customer type'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.created_branch_id IS 'Unique identifier for the branch'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.balance IS 'Account balance'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.password IS 'Account password'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.closing_date IS 'Date account registration was closed'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.created_at IS 'Date when the account record was created'
/
COMMENT ON COLUMN TPT_USER_DBA.ACCOUNT.updated_at IS 'Date when the account record was last updated'
/
