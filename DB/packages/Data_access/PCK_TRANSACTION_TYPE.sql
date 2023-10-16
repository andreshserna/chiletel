CREATE OR REPLACE PACKAGE PCK_TRANSACTION_TYPE IS
/*******************************************************************************
Description: Package that manages transaction types in the bank
Author: Team B
Date: [Fecha]
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

    /* Public data types declaration */
    SUBTYPE tyrcTRANSACTIONTYPE IS TRANSACTION_TYPE%ROWTYPE;
    TYPE tytbTRANSACTIONTYPE IS TABLE OF tyrcTRANSACTIONTYPE INDEX BY BINARY_INTEGER;

    /* Public methods and functions declaration */

    
    /*******************************************************************************
    Description: Procedure that inserts a transaction type object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Insert_TRANSACTIONTYPE
    (
        IOp_Transaction_Type IN OUT NOCOPY tyrcTRANSACTIONTYPE
    );


    /*******************************************************************************
    Description: Procedure that gets all transaction types
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_All_TRANSACTIONTYPE
    (
        Op_Transaction_Type OUT NOCOPY tytbTRANSACTIONTYPE
    );


    /*******************************************************************************
    Description: Procedure that gets a transaction type object by id
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_TRANSACTIONTYPE
    (
        Ip_Id IN NUMBER, Op_Transaction_Type OUT NOCOPY tyrcTRANSACTIONTYPE
    );


    /*******************************************************************************
    Description: Procedure that updates a transaction type by its id
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Update_TRANSACTIONTYPE
    (
        IOp_Transaction_Type IN OUT NOCOPY tyrcTRANSACTIONTYPE
    );


END PCK_TRANSACTION_TYPE;



CREATE OR REPLACE PACKAGE BODY PCK_TRANSACTION_TYPE IS

    /* Insert a Transaction Type */
    PROCEDURE Proc_Insert_TRANSACTIONTYPE(IOp_Transaction_Type IN OUT NOCOPY tyrcTRANSACTIONTYPE) IS
    BEGIN
        -- Initialize values
        IOp_Transaction_Type.transaction_type_id := SEQ_TRANSACTION_TYPE.NEXTVAL;

        -- Insert register
        INSERT INTO TRANSACTION_TYPE VALUES /*+PCK_TRANSACTION_TYPE.Proc_Insert_TRANSACTIONTYPE*/ IOp_Transaction_Type;

    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20000, 'Error: Valor duplicado en la clave primaria o única [PCK_TRANSACTION_TYPE.insTRANSACTIONTYPE]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, SQLCODE || ' => ' || SQLERRM);
    END Proc_Insert_TRANSACTIONTYPE;


    /* Get All Transaction Types */
    PROCEDURE Proc_Get_All_TRANSACTIONTYPE(Op_Transaction_Type OUT NOCOPY tytbTRANSACTIONTYPE) IS
        CURSOR cur_TRANSACTIONTYPE IS
            SELECT
                transaction_type_id,
                description
            FROM TRANSACTION_TYPE;
        idx BINARY_INTEGER := 1;

    BEGIN
        FOR rec IN cur_TRANSACTIONTYPE LOOP
            Op_Transaction_Type(idx) := rec;
            idx := idx + 1;
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_TRANSACTION_TYPE.Proc_Get_All_TRANSACTIONTYPE]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Get_All_TRANSACTIONTYPE;


    /* Get Transaction Type By Id */
    PROCEDURE Proc_Get_TRANSACTIONTYPE(Ip_Id IN NUMBER, Op_Transaction_Type OUT NOCOPY tyrcTRANSACTIONTYPE) IS
        CURSOR cur_TRANSACTIONTYPE IS
            SELECT
                transaction_type_id,
                description
            FROM TRANSACTION_TYPE
            WHERE /*+PCK_TRANSACTION_TYPE.Proc_Get_TRANSACTIONTYPE*/ transaction_type_id = Ip_Id;

    BEGIN
        OPEN cur_TRANSACTIONTYPE;
        FETCH cur_TRANSACTIONTYPE INTO Op_Transaction_Type;
        CLOSE cur_TRANSACTIONTYPE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_TRANSACTION_TYPE.Proc_Get_TRANSACTIONTYPE]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Get_TRANSACTIONTYPE;


    /* Updates a Transaction Type */
    PROCEDURE Proc_Update_TRANSACTIONTYPE(IOp_Transaction_Type IN OUT NOCOPY tyrcTRANSACTIONTYPE) IS
        v_updated_record tyrcTRANSACTIONTYPE;
    BEGIN
        -- Update record
        UPDATE TRANSACTION_TYPE
        SET description = IOp_Transaction_Type.description
        WHERE transaction_type_id = IOp_Transaction_Type.transaction_type_id;
       
        Proc_Get_TRANSACTIONTYPE(IOp_Transaction_Type.transaction_type_id, v_updated_record);
        IOp_Transaction_Type := v_updated_record;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Update_TRANSACTIONTYPE;

END PCK_TRANSACTION_TYPE;
