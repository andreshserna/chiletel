CREATE PLUGGABLE DATABASE TALLER_PRUEBA_TECHCAMP
ADMIN USER tpt_admin IDENTIFIED BY &admin_pass
DEFAULT TABLESPACE TS_MANAGER
DATAFILE 'C:/taller_techcamp_datafiles/TALLER_PRUEBA_TECHCAMP.dbf' SIZE 500M AUTOEXTEND ON
FILE_NAME_CONVERT = ('C:\APP\CHIEFPC\PRODUCT\21C\ORADATA\XE\PDBSEED\', 'C:/taller_techcamp_datafiles/');



-- Set permissions
@./sys/permissions/TPT_ROL_USER_CONEXION.sql
@./sys/permissions/TPT_ROL_USER_DBA.sql
-- @./sys/permissions/TPT_ROL_USER_PROCEDATOS.sql

-- Crete tablespaces
-- @./sys/tablespaces/TPT_TABLESPACE.sql
@./sys/tablespaces/TPT_TS_CONNECTION.sql
@./sys/tablespaces/TPT_TS_MANAGER.sql

-- Create users
@./sys/users/TPT_USER_DBA.sql
-- @./sys/users/TPT_USER_FINAL_1.sql
-- @./sys/users/TPT_USER_FINAL_2.sql



-- Create tables
@./tables/TPT_ACCOUNT_TYPE.sql
@./tables/TPT_DOCUMENT_TYPE.sql
@./tables/TPT_TRANSACTION_TYPE.sql
@./tables/TPT_BANK_BRANCH.sql
@./tables/TPT_CUSTOMER.sql
@./tables/TPT_ACCOUNT.sql
@./tables/TPT_TRANSACTION.sql

-- Create sequences
@./sequences/SEQ_ACCOUNT_TYPE.sql
@./sequences/SEQ_DOCUMENT_TYPE.sql
@./sequences/SEQ_TRANSACTION_TYPE.sql
@./sequences/SEQ_BANK_BRANCH.sql
@./sequences/SEQ_CUSTOMER.sql
@./sequences/SEQ_ACCOUNT.sql
@./sequences/SEQ_TRANSACTION.sql

-- Create PKs
@./indexes/PK_ACCOUNT_TYPE.sql
@./indexes/PK_ACCOUNT.sql
@./indexes/PK_BANK_BRANCH.sql
@./indexes/PK_CUSTOMER.sql
@./indexes/PK_DOCUMENT_TYPE.sql
@./indexes/PK_TRANSACTION_TYPE.sql
@./indexes/PK_TRANSACTION.sql

-- Add indexes
@./indexes/IDX_ACCOUNT_TYPE.sql
@./indexes/IDX_ACCOUNT.sql
@./indexes/IDX_BANK_BRANCH.sql
@./indexes/IDX_CUSTOMER.sql
@./indexes/IDX_DOCUMENT_TYPE.sql
@./indexes/IDX_TRANSACTION_TYPE.sql
@./indexes/IDX_TRANSACTION.sql

-- Set references
@./references/FK_ACCOUNT_ACCOUNT_TYPE.sql
@./references/FK_ACCOUNT_BANK_BRANCH.sql
@./references/FK_ACCOUNT_CUSTOMER.sql
@./references/FK_CUSTOMER_DOCUMENT_TYPE.sql
@./references/FK_TRANSACTION_ACCOUNT_01.sql
@./references/FK_TRANSACTION_ACCOUNT_02.sql
@./references/FK_TRANSACTION_BANK_BRANCH.sql
@./references/FK_TRANSACTION_TRANSACTION_TYPE.sql
