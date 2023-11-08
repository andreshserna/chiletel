BEGIN 
    INSERT INTO APP_ATEN_DANOS.CREW(CREW_ID, NAME, ZONE)
    VALUES (1, 'Valdivia y Lanco 1', 'VALLC');
    
    INSERT INTO APP_ATEN_DANOS.CREW(CREW_ID, NAME, ZONE)
    VALUES (2, 'San Jose y Mafil 1', 'SJMF'); 

    INSERT INTO APP_ATEN_DANOS.CREW(CREW_ID, NAME, ZONE)
    VALUES (3, 'Panguipulli y Los Lagos', 'PULLL'); 

    INSERT INTO APP_ATEN_DANOS.CREW(CREW_ID, NAME, ZONE)
    VALUES (4, 'Paillaco y Corral', 'POCL'); 

    INSERT INTO APP_ATEN_DANOS.CREW(CREW_ID, NAME, ZONE)
    VALUES (5, 'Los Lagos y San Jose', 'LLSJ'); 

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20000, SQLCODE || '=>' || SQLERRM, TRUE);   
END;
