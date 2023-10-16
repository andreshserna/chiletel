/*******************************************************************************
Description: Table that stores the information of the bank's clients
Author: Team B
Date: 22-09-23
Management_id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

CREATE TABLE TPT_USER_DBA.DOCUMENT_TYPE(
    document_type_id NUMBER(10),
    type_code VARCHAR2(20),
    description VARCHAR2(50)
) TABLESPACE TS_MANAGER;

COMMENT ON TABLE TPT_USER_DBA.DOCUMENT_TYPE IS 'Table that stores the different types of documents that a customer can have.'
/
COMMENT ON COLUMN TPT_USER_DBA.DOCUMENT_TYPE.document_type_id IS 'Unique identifier for the document type. It is the primary key for the table.'
/
COMMENT ON COLUMN TPT_USER_DBA.DOCUMENT_TYPE.type_code IS 'Abreviation of the document type.'
/
COMMENT ON COLUMN TPT_USER_DBA.DOCUMENT_TYPE.description IS 'Description of the document type, explaining what each code represents.'
/
INSERT INTO TPT_USER_DBA.DOCUMENT_TYPE (type_code, description) VALUES ('CC', 'Cédula de Ciudadanía')
/
INSERT INTO TPT_USER_DBA.DOCUMENT_TYPE (type_code, description) VALUES ('TI', 'Tarjeta de Identidad')
/
INSERT INTO TPT_USER_DBA.DOCUMENT_TYPE (type_code, description) VALUES ('NIT', 'Número de Identificación Tributaria')
/
INSERT INTO TPT_USER_DBA.DOCUMENT_TYPE (type_code, description) VALUES ('CE', 'Cédula de Extranjería')
/
INSERT INTO TPT_USER_DBA.DOCUMENT_TYPE (type_code, description) VALUES ('PA', 'Pasaporte')