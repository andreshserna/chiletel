BEGIN 
    -- Asumiendo que cada técnico tiene una especialidad única para simplificar
    INSERT INTO APP_ATEN_DANOS.TECHNICIAN_SPECIALTY(TECHNICIAN_ID, DAMAGE_ID)
    VALUES (1, 1);
    
    INSERT INTO APP_ATEN_DANOS.TECHNICIAN_SPECIALTY(TECHNICIAN_ID, DAMAGE_ID)
    VALUES (2, 2);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN_SPECIALTY(TECHNICIAN_ID, DAMAGE_ID)
    VALUES (3, 3);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN_SPECIALTY(TECHNICIAN_ID, DAMAGE_ID)
    VALUES (4, 4);

    INSERT INTO APP_ATEN_DANOS.TECHNICIAN_SPECIALTY(TECHNICIAN_ID, DAMAGE_ID)
    VALUES (5, 5);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20000, SQLCODE || '=>' || SQLERRM, TRUE);   
END;