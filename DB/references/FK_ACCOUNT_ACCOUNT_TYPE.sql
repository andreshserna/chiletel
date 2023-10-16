/*******************************************************************************
Description: Table that stores information about bank's transactions
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

ALTER TABLE TPT_USER_DBA.ACCOUNT ADD CONSTRAINT FK_ACCOUNT_ACCOUNT_TYPE FOREIGN KEY (account_type_id) REFERENCES TPT_USER_DBA.ACCOUNT_TYPE (account_type_id)
/