BEGIN 
    INSERT INTO APP_ATEN_DANOS.DAMAGE(DAMAGE_ID, DESCRIPTION, PRIORITY, ESTIMATED_DURATION)
    VALUES (1, 'Daño eléctrico menor', 1, INTERVAL '1' HOUR);
    
    INSERT INTO APP_ATEN_DANOS.DAMAGE(DAMAGE_ID, DESCRIPTION, PRIORITY, ESTIMATED_DURATION)
    VALUES (2, 'Daño de infraestructura', 2, INTERVAL '2' HOUR);

    INSERT INTO APP_ATEN_DANOS.DAMAGE(DAMAGE_ID, DESCRIPTION, PRIORITY, ESTIMATED_DURATION)
    VALUES (3, 'Daño de hardware crítico', 3, INTERVAL '3' HOUR);

    INSERT INTO APP_ATEN_DANOS.DAMAGE(DAMAGE_ID, DESCRIPTION, PRIORITY, ESTIMATED_DURATION)
    VALUES (4, 'Fallo de software', 4, INTERVAL '4' HOUR);

    INSERT INTO APP_ATEN_DANOS.DAMAGE(DAMAGE_ID, DESCRIPTION, PRIORITY, ESTIMATED_DURATION)
    VALUES (5, 'Corte de servicios esenciales', 5, INTERVAL '5' HOUR);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20000, SQLCODE || '=>' || SQLERRM, TRUE);   
END;


