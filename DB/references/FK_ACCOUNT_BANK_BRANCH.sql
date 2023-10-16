/*******************************************************************************
Description: Foreign Key from account table to customer table
Author: Team B
Date: 25-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/
ALTER TABLE TPT_USER_DBA.ACCOUNT ADD CONSTRAINT FK_ACCOUNT_BANK_BRANCH FOREIGN KEY (created_branch_id) REFERENCES TPT_USER_DBA.BANK_BRANCH (bank_branch_id)
/

