/*******************************************************************************
Description: Table that stores the information of the bank's clients
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE OR REPLACE TYPE TPT_USER_DBA.TYRC_ACCOUNT AS OBJECT
(
    ACCOUNT_ID NUMBER(10),
    CUSTOMER_ID NUMBER(10),
    ACCOUNT_TYPE_ID NUMBER(10),
    CREATED_BRANCH_ID NUMBER(10),
    BALANCE NUMBER(15),
    CLOSING_DATE TIMESTAMP,
    CREATED_AT TIMESTAMP
);
