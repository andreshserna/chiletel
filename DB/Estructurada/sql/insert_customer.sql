BEGIN 
    INSERT INTO APP_ATEN_DANOS.CUSTOMER(NAME, ADDRESS, DISTRICT, TYPE)
    VALUES ('Hospital Central', 'Av. Principal 123', 'Valdivia', 5);
    
    INSERT INTO APP_ATEN_DANOS.CUSTOMER(CUSTOMER_ID, NAME, ADDRESS, DISTRICT, TYPE)
    VALUES ('Municipalidad', 'Calle 45 #678', 'San Jose', 4);

    INSERT INTO APP_ATEN_DANOS.CUSTOMER(CUSTOMER_ID, NAME, ADDRESS, DISTRICT, TYPE)
    VALUES ('Empresa XYZ', 'Calle Falsa 123', 'Lanco', 2);

    INSERT INTO APP_ATEN_DANOS.CUSTOMER(CUSTOMER_ID, NAME, ADDRESS, DISTRICT, TYPE)
    VALUES ('Residencia de Carlos', 'Calle 8 #234', 'Mafil', 1);

    INSERT INTO APP_ATEN_DANOS.CUSTOMER(CUSTOMER_ID, NAME, ADDRESS, DISTRICT, TYPE)
    VALUES ('Comercio Local', 'Av. Libertador 456', 'Panguipulli', 3);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20000, SQLCODE || '=>' || SQLERRM, TRUE);   
END;
