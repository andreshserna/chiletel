/*******************************************************************************
Description: Foreign Key from transaction table to bank branch table
Author: Team B
Date: 25-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/
ALTER TABLE TPT_USER_DBA.TRANSACTION ADD CONSTRAINT FK_TRANSACTION_BANK_BRANCH FOREIGN KEY (bank_branch_id) REFERENCES TPT_USER_DBA.BANK_BRANCH (bank_branch_id)
/