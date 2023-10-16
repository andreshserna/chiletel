/*******************************************************************************
Description: Foreign Key from transaction table to transaction type table
Author: Team B
Date: 25-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/
ALTER TABLE TPT_USER_DBA.TRANSACTION ADD CONSTRAINT FK_TRANSACTION_TRANSACTION_TYPE FOREIGN KEY (transaction_type_id) REFERENCES TPT_USER_DBA.TRANSACTION_TYPE (transaction_type_id)
/