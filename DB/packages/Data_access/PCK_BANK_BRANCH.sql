CREATE OR REPLACE PACKAGE PCK_BANK_BRANCH IS
/*******************************************************************************
Description: Package to manage data access for Bank branch records
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

    /* Public data types declaration */
    SUBTYPE tyrcBANKBRANCH IS BANK_BRANCH%ROWTYPE;

    TYPE tytbBANKBRANCH IS TABLE OF tyrcBANKBRANCH INDEX BY BINARY_INTEGER;

     /* Public variables declaration */



    /* Public methods and functions declaration */

    /*******************************************************************************
    Description: Procedure that inserts a bank branch object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Insert_BANKBRANCH 
    (
        IOp_Bank_Branch IN OUT NOCOPY tyrcBANKBRANCH 
    );


    /*******************************************************************************
    Description: Procedure that obtains all bank branch
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_All_BANKBRANCH
    (
        Op_Bank_Branch OUT NOCOPY tytbBANKBRANCH
    );


    /*******************************************************************************
    Description: Procedure that obtains a bank branch
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_BANKBRANCH
    (
        Ip_Id in NUMBER,
        Op_Bank_Branch OUT NOCOPY tyrcBANKBRANCH
    );


    /*******************************************************************************
    Description: Procedure that updates a bank branch object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Update_BANKBRANCH
    (
        IOp_Bank_Branch IN OUT NOCOPY tyrcBANKBRANCH
    );

END PCK_BANK_BRANCH;


CREATE OR REPLACE PACKAGE BODY PCK_BANK_BRANCH IS

    /*Insert an account type*/
    PROCEDURE Proc_Insert_BANKBRANCH(IOp_Bank_Branch IN OUT NOCOPY tyrcBANKBRANCH) IS

    BEGIN

        -- Initialize values
        IOp_Bank_Branch.bank_branch_id := SEQ_Bank_Branch.NEXTVAL;

        -- Insert register
        INSERT INTO BANK_BRANCH VALUES /*+PCK_BANK_BRANCH.Proc_Insert_BANKBRANCH*/ IOp_Bank_Branch;

    -- Trow Exception
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20000, 'Error: Valor duplicado en la clave primaria o única [PCK_BANK_BRANCH.insBANKBRANCH]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, SQLCODE || ' => ' || SQLERRM);
    END Proc_Insert_BANKBRANCH;


    /* Get all bank branches */
    PROCEDURE Proc_Get_All_BANKBRANCH(Op_Bank_Branch OUT NOCOPY tytbBANKBRANCH) IS
    	CURSOR cur_BANKBRANCH IS
	        SELECT
	            bank_branch_id,
	            bank_branch_name,
	            address,
                phone_number,
                is_digital,
                created_at
	        FROM BANK_BRANCH;
		    idx BINARY_INTEGER := 1;
	BEGIN
	    FOR rec IN cur_BANKBRANCH LOOP
	        Op_Bank_Branch(idx) := rec;
	        idx := idx + 1;
	    END LOOP;
	EXCEPTION
	    WHEN NO_DATA_FOUND THEN 
	        RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_BANK_BRANCH.Proc_Get_BANKBRANCH]');
	    WHEN OTHERS THEN
	        RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
	END Proc_Get_All_BANKBRANCH;


    /* Get By Id*/
    PROCEDURE Proc_Get_BANKBRANCH (Ip_Id IN NUMBER, Op_Bank_Branch OUT NOCOPY tyrcBANKBRANCH) IS

        CURSOR cur_BANKBRANCH IS
            SELECT 
                bank_branch_id,
	            bank_branch_name,
	            address,
                phone_number,
                is_digital,
                created_at
            FROM BANK_BRANCH
            WHERE /*+PCK_BANK_BRANCH.Proc_Get_BANKBRANCH*/ bank_branch_id = Ip_Id;

    BEGIN
        OPEN cur_BANKBRANCH;
        FETCH cur_BANKBRANCH INTO Op_Bank_Branch;
        CLOSE cur_BANKBRANCH;
    
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_BANK_BRANCH.Proc_Get_BANKBRANCH]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Get_BANKBRANCH;


    /* Updates an account type */
    PROCEDURE Proc_Update_BANKBRANCH (IOp_Bank_Branch IN OUT NOCOPY tyrcBANKBRANCH) IS
        v_updated_record tyrcBANKBRANCH;
    BEGIN
        /* Update record */
        UPDATE BANK_BRANCH
        SET branch_name = IOp_Bank_Branch.branch_name,
            address = IOp_Bank_Branch.address,
            phone_number = IOp_Bank_Branch.phone_number,
            is_digital = IOp_Bank_Branch.is_digital
        WHERE bank_branch_id = IOp_Bank_Branch.bank_branch_id;
       
		Proc_Get_BANKBRANCH(IOp_Bank_Branch.bank_branch_id, v_updated_record);
		IOp_Bank_Branch := v_updated_record;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Update_BANKBRANCH;

END PCK_BANK_BRANCH;
    