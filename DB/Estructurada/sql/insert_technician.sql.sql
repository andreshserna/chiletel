BEGIN 
    INSERT INTO APP_ATEN_DANOS.TECHNICIAN(TECHNICIAN_ID, NAME, DOCUMENT, DOCUMENT_TYPE, CREW_ID)
    VALUES (1, 'Juan Pérez', '12345678', 'CC', 1);
    
    INSERT INTO APP_ATEN_DANOS.TECHNICIAN(TECHNICIAN_ID, NAME, DOCUMENT, DOCUMENT_TYPE, CREW_ID)
    VALUES (2, 'Ana Gómez', '87654321', 'CC', 2);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN(TECHNICIAN_ID, NAME, DOCUMENT, DOCUMENT_TYPE, CREW_ID)
    VALUES (3, 'Carlos Ruiz', '23456789', 'CC', 3);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN(TECHNICIAN_ID, NAME, DOCUMENT, DOCUMENT_TYPE, CREW_ID)
    VALUES (4, 'Luisa Fernanda', '98765432', 'CC', 4);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN(TECHNICIAN_ID, NAME, DOCUMENT, DOCUMENT_TYPE, CREW_ID)
    VALUES (5, 'Sergio López', '34567890', 'CC', 5);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20000, SQLCODE || '=>' || SQLERRM, TRUE);   
END;