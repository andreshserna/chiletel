/*******************************************************************************
Description: Table that stores information about bank's transactions
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.TRANSACTION(
    transaction_id NUMBER(10),
    transaction_type_id NUMBER(10),
    bank_branch_id NUMBER(10),
    account_id NUMBER(10),
    destination_account_id NUMBER(10),
    amount NUMBER(10) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) TABLESPACE TS_MANAGER;

COMMENT ON TABLE TPT_USER_DBA.TRANSACTION IS 'Transaction table'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.transaction_id IS 'Unique identifier for the transaction'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.transaction_type_id IS 'Identifier for the type of transaction'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.bank_branch_id IS 'Identifier for the bank branch where the transaction was made'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.account_id IS 'Identifier for the account where the transaction was made'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.destination_account_id IS 'Identifier for the destination account of the transaction'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.amount IS 'Identifier for the amount of the transaction'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION.created_at IS 'Date when the transaction record was created'
/
