CREATE OR REPLACE PROCEDURE APP_ATEN_DANOS.assign_technicians AS
    tecnico_id NUMBER;
BEGIN
    FOR registro IN (
        SELECT ao.ORDER_ID, ao.DAMAGE_ID, ao.CUSTOMER_ID, ao.REPORT_DATE,
               (d.PRIORITY * 5) + (c.TYPE * 3) + (SYSDATE - ao.REPORT_DATE) AS TOTAL_PRIORITY
        FROM APP_ATEN_DANOS.ATTENTION_ORDER ao
        JOIN APP_ATEN_DANOS.DAMAGE d ON ao.DAMAGE_ID = d.DAMAGE_ID
        JOIN APP_ATEN_DANOS.CUSTOMER c ON ao.CUSTOMER_ID = c.CUSTOMER_ID
        WHERE ao.TECHNICIAN_ID IS NULL AND ao.FIXED_DATE IS NULL
        ORDER BY TOTAL_PRIORITY DESC, d.PRIORITY DESC, c.TYPE DESC, ao.REPORT_DATE ASC
    ) LOOP

        BEGIN
            -- teccnico con la especialidad adecuada
            SELECT ts.TECHNICIAN_ID INTO tecnico_id
            FROM APP_ATEN_DANOS.TECHNICIAN_SPECIALTY ts
            WHERE ts.DAMAGE_ID = registro.DAMAGE_ID
            AND ROWNUM = 1;

            -- Actualizar la orden  con el tecnico asignado
            UPDATE APP_ATEN_DANOS.ATTENTION_ORDER
            SET TECHNICIAN_ID = tecnico_id
            WHERE ORDER_ID = registro.ORDER_ID;

        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- excepción donde no existe técnico especializado en el daño
                NULL; --permite el paso al siguiente registro 
        END;

    END LOOP;
END;