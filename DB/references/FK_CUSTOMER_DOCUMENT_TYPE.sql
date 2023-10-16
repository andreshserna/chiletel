/*******************************************************************************
Description: Foreign Key from document type table to customer table
Author: Team B
Date: 25-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/
ALTER TABLE TPT_USER_DBA.CUSTOMER ADD CONSTRAINT FK_CUSTOMER_DOCUMENT_TYPE FOREIGN KEY (document_type_id) REFERENCES TPT_USER_DBA.DOCUMENT_TYPE (document_type_id)
/