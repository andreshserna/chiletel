CREATE OR REPLACE PACKAGE PCK_ACCOUNT_TYPE IS
/*******************************************************************************
Description: Package to manage data access for Account type records
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

    /* Public data types declaration */

    SUBTYPE tyrcACCOUNTTYPE IS ACCOUNT_TYPE%ROWTYPE;

    TYPE tytbACCOUNTTYPE IS TABLE OF tyrcACCOUNTTYPE INDEX BY BINARY_INTEGER;

    /* Public variables declaration */



    /* Public methods and functions declaration */

    /*******************************************************************************
    Description: Procedure that inserts an account type object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Insert_ACCOUNTTYPE
    (
        IOp_Account_Type IN OUT NOCOPY tyrcACCOUNTTYPE
    );


    /*******************************************************************************
    Description: Procedure that obtains all account types
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_All_ACCOUNTTYPE
    (
        Op_Account_Type OUT NOCOPY tytbACCOUNTTYPE
    );


    /*******************************************************************************
    Description: Procedure that obtains an account type object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_ACCOUNTTYPE
    (
        Ip_Id in NUMBER,
        Op_Account_Type OUT NOCOPY tyrcACCOUNTTYPE
    );


    /*******************************************************************************
    Description: Procedure that updates an account type object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Update_ACCOUNTTYPE
    (
        IOp_Account_Type IN OUT NOCOPY tyrcACCOUNTTYPE
    );

END PCK_ACCOUNT_TYPE;



CREATE OR REPLACE PACKAGE BODY PCK_ACCOUNT_TYPE IS

    /*Insert an account type*/
    PROCEDURE Proc_Insert_ACCOUNTTYPE(IOp_Account_Type IN OUT NOCOPY tyrcACCOUNTTYPE) IS

    BEGIN

        -- Initialize values
        IOp_Account_Type.account_type_id := SEQ_ACCOUNT_TYPE.NEXTVAL;

        -- Insert register
        INSERT INTO ACCOUNT_TYPE VALUES /*+PCK_ACCOUNT_TYPE.Proc_Insert_ACCOUNTTYPE*/ IOp_Account_Type;

    -- Trow Exception
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20000, 'Error: Valor duplicado en la clave primaria o única [PCK_ACCOUNT_TYPE.insACCOUNTTYPE]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, SQLCODE || ' => ' || SQLERRM);
    END Proc_Insert_ACCOUNTTYPE;


    /* Get all account types */
    PROCEDURE Proc_Get_All_ACCOUNTTYPE(Op_Account_Type OUT NOCOPY tytbACCOUNTTYPE) IS
    	CURSOR cur_ACCOUNTTYPE IS
	        SELECT
	            account_type_id,
	            account_name,
	            rate
	        FROM ACCOUNT_TYPE;
		    idx BINARY_INTEGER := 1;
	BEGIN
	    FOR rec IN cur_ACCOUNTTYPE LOOP
	        Op_Account_Type(idx) := rec;
	        idx := idx + 1;
	    END LOOP;
	EXCEPTION
	    WHEN NO_DATA_FOUND THEN 
	        RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_ACCOUNT_TYPE.Proc_Get_ACCOUNTTYPE]');
	    WHEN OTHERS THEN
	        RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
	END Proc_Get_All_ACCOUNTTYPE;


    /* Get By Id*/
    PROCEDURE Proc_Get_ACCOUNTTYPE (Ip_Id IN NUMBER, Op_Account_Type OUT NOCOPY tyrcACCOUNTTYPE) IS

        CURSOR cur_ACCOUNTTYPE IS
            SELECT 
                account_type_id,
                account_name,
                rate 
            FROM ACCOUNT_TYPE
            WHERE /*+PCK_ACCOUNT_TYPE.Proc_Get_ACCOUNTTYPE*/ account_type_id = Ip_Id;

    BEGIN
        OPEN cur_ACCOUNTTYPE;
        FETCH cur_ACCOUNTTYPE INTO Op_Account_Type;
        CLOSE cur_ACCOUNTTYPE;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_ACCOUNT_TYPE.Proc_Get_ACCOUNTTYPE]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Get_ACCOUNTTYPE;


    /* Updates an account type */
    PROCEDURE Proc_Update_ACCOUNTTYPE (IOp_Account_Type IN OUT NOCOPY tyrcACCOUNTTYPE) IS
        v_updated_record tyrcACCOUNTTYPE;
    BEGIN
        /* Update record */
        UPDATE ACCOUNT_TYPE
        SET rate = IOp_Account_Type.rate
        WHERE account_type_id = IOp_Account_Type.account_type_id;
       
		Proc_Get_ACCOUNTTYPE(IOp_Account_Type.account_type_id, v_updated_record);
		IOp_Account_Type := v_updated_record;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Update_ACCOUNTTYPE;

END PCK_ACCOUNT_TYPE;
    