/*******************************************************************************
Description: Table that stores information about bank's transactions
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.TRANSACTION_TYPE(
    transaction_type_id NUMBER(10) NOT NULL,
    description VARCHAR2(50) NOT NULL
) TABLESPACE TS_MANAGER;

INSERT INTO TPT_USER_DBA.TRANSACTION_TYPE (transaction_type_id, description) VALUES ('1', 'Retiro')
/
INSERT INTO TPT_USER_DBA.TRANSACTION_TYPE (transaction_type_id, description) VALUES ('2', 'Consignación')
/
INSERT INTO TPT_USER_DBA.TRANSACTION_TYPE (transaction_type_id, description) VALUES ('3', 'Interéses')
/
COMMENT ON TABLE TPT_USER_DBA.TRANSACTION_TYPE IS 'Document type table'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION_TYPE.transaction_type_id IS 'Unique identifier for the transaction type. It is the primary key for the table.'
/
COMMENT ON COLUMN TPT_USER_DBA.TRANSACTION_TYPE.description IS 'Description of the transaction type, explaining what each code represents.'
/
