/*******************************************************************************
Description: Script
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

-- PASSWORD
PROMPT 
PROMPT specify password for TPT_USER_DBA as parameter 1:
DEFINE pass=&1;

-- CREATING USER

CREATE USER TPT_USER_DBA
IDENTIFIED BY CONTRASENA
DEFAULT TABLESPACE TS_MANAGER
TEMPORARY TABLESPACE temp;

-- ASSIGNING ROLE TO USER

GRANT ROL_USER_DBA TO TPT_USER_DBA;

