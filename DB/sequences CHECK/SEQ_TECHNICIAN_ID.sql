CREATE SEQUENCE technician_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE OR REPLACE TRIGGER technician_bir 
BEFORE INSERT ON technician 
FOR EACH ROW
BEGIN
  SELECT technician_seq.NEXTVAL
  INTO   :new.technician_id
  FROM   dual;
END;
