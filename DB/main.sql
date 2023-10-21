-- Create Pluggable Database
CREATE PLUGGABLE DATABASE CHILETEL_PRUEBA
ADMIN USER chile_admin IDENTIFIED BY &admin_pass
DATAFILE 'C:/chiletel_datafiles/CHILETEL_PRUEBA.dbf' SIZE 500M AUTOEXTEND ON
FILE_NAME_CONVERT = ('C:\APP\CHIEFPC\PRODUCT\21C\ORADATA\XE\PDBSEED\', 'C:/chiletel_datafiles/');

-- Set permissions
@./sys/permissions/CHILE_ROL_USER_CONEXION.sql
@./sys/permissions/CHILE_ROL_USER_DBA.sql
 
@./sys/users/CHILE_USER_DBA.sql

-- Create tables
@./tables/TPT_CUSTOMER.sql
@./tables/TPT_DAMAGE.sql
@./tables/TPT_TECHNICIAN.sql
@./tables/TPT_CREW.sql
@./tables/TPT_ATTENTION_ORDER.sql
@./tables/TPT_TECHNICIAN_SPECIALTY.sql

-- Create sequences CEHCJKCNECEJHNCUAHSECUEJSFHEHUF
@./sequences/SEQ_CUSTOMER.sql
@./sequences/SEQ_DAMAGE.sq
@./sequences/SEQ_TECHNICIAN.sql
@./sequences/SEQ_CREW.sql
@./sequences/SEQ_ATTENTION_ORDER.sql
@./sequences/SEQ_TECHNICIAN_SPECIALTY.sql

-- Create PKs
@./indexes/PK_CUSTOMER.sql
@./indexes/PK_DAMAGE.sql
@./indexes/PK_TECHNICIAN.sql
@./indexes/PK_CREW.sql
@./indexes/PK_ATTENTION_ORDER.sql
@./indexes/PK_TECHNICIAN_SPECIALTY.sql

-- Add indexes fadfawsfased fdesfdsfsdfsd
@./indexes/IDX_CUSTOMER.sql
@./indexes/IDX_DAMAGE.sql
@./indexes/IDX_TECHNICIAN.sql
@./indexes/IDX_CREW.sql
@./indexes/IDX_ATTENTION_ORDER.sql
@./indexes/IDX_TECHNICIAN_SPECIALTY.sql

-- Set references
@./references/FK_ATTENTION_ORDER_CUSTOMER.sql
@./references/FK_ATTENTION_ORDER_DAMAGE.sql
@./references/FK_ATTENTION_ORDER_TECHNICIAN.sql
@./references/FK_TECHNICIAN_CREW.sql
@./references/FK_TECHNICIAN_SPECIALTY_TECHNICIAN.sql
@./references/FK_TECHNICIAN_SPECIALTY_DAMAGE.sql
