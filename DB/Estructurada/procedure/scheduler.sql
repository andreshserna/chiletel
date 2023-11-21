BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'asignar_tecnicos_job',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN asignar_tecnicos; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=21; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/
