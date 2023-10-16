/*******************************************************************************
Description: Table that stores the information of the bank's clients
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE OR REPLACE TYPE TPT_USER_DBA.TYRC_CUSTOMER AS OBJECT
(
    CUSTOMER_ID NUMBER(10),
    FIRST_NAME VARCHAR2(20),
    SECOND_NAME VARCHAR2(20),
    LAST_NAME VARCHAR2(20),
    SECOND_LAST_NAME VARCHAR2(20),
    BIRTHDATE DATE,
    DOCUMENT VARCHAR2(20),
    DOCUMENT_TYPE_ID NUMBER(2),
    ADDRESS VARCHAR2(100),
    EMAIL VARCHAR2(50),
    PHONE_NUMBER VARCHAR2(20),
    CREATED_AT TIMESTAMP
);
