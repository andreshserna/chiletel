CREATE OR REPLACE PACKAGE PCK_TRANSACTION IS
/*******************************************************************************
Description: Package to manage data access for Transaction records
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

    /* Public data types declaration */

    SUBTYPE tyrcTRANSACTION IS `TRANSACTION`%ROWTYPE;

    TYPE tytbTRANSACTION IS TABLE OF tyrcTRANSACTION INDEX BY BINARY_INTEGER;

    /* Public variables declaration */


    /* Public methods and functions declaration */

    /*******************************************************************************
    Description: Procedure that inserts a transaction object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Insert_TRANSACTION
    (
        IOp_Transaction IN OUT NOCOPY tyrcTRANSACTION
    );


    /*******************************************************************************
    Description: Procedure that gets all transactions
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_All_TRANSACTION
    (
        Op_Transaction OUT NOCOPY tytbTRANSACTION
    );


    /*******************************************************************************
    Description: Procedure that gets a transaction by id
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Get_TRANSACTION
    (
        Ip_Id in NUMBER,
        Op_Transaction OUT NOCOPY tyrcTRANSACTION
    );

END PCK_TRANSACTION;

CREATE OR REPLACE PACKAGE BODY PCK_TRANSACTION IS

    /*Insert a Transaction*/
    PROCEDURE Proc_Insert_TRANSACTION(IOp_Transaction IN OUT NOCOPY tyrcTRANSACTION) IS
    BEGIN
        -- Initialize values
        IOp_Transaction.transaction_id := SEQ_TRANSACTION.NEXTVAL;

        -- Insert Register
        INSERT INTO TRANSACTION VALUES IOp_Transaction;
    -- Throw Exception
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20000, 'Uy zona Uy zona(●'◡'●)(❁´◡`❁)');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20001, SQLCODE || ' => ' || SQLERRM);
    END Proc_Insert_TRANSACTIOn;


    /*Get All Transactions*/
    PROCEDURE Proc_Get_All_TRANSACTION(Op_Transaction OUT NOCOPY tytbTRANSACTION) IS
        CURSOR cur_TRANSACTION IS
            SELECT
                transaction_id,
                transaction_type_id,
                bank_branch_id,
                account_id,
                destination_account_id,
                amount,
            FROM `TRANSACTION`;
            idx BINARY_INTEGER := 1;
    BEGIN
        FOR rec IN cur_TRANSACTION LOOP
            Op_Transaction(idx) := rec;
            idx := idx + 1;
        END LOOP;
	EXCEPTION
	    WHEN NO_DATA_FOUND THEN 
	        RAISE_APPLICATION_ERROR(-20150, 'Uy zona(●'◡'●)(❁´◡`❁)');
	    WHEN OTHERS THEN
	        RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
	END Proc_Get_All_TRANSACTION;


    /*Get Transaction by ID*/
    PROCEDURE Proc_Get_TRANSACTION (Ip_Id IN NUMBER, Op_Transaction) IS

        CURSOR cur_TRANSACTION IS
            SELECT 
                transaction_id,
                transaction_type_id,
                bank_branch_id,
                account_id,
                destination_account_id,
                amount,
            FROM `TRANSACTION`
            WHERE transaction_id = Ip_Id;

    BEGIN
        OPEN cur_TRANSACTION;
        FETCH cur_TRANSACTION INTO Op_Transaction;
        CLOSE cur_TRANSACTION;

    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR(-20150, 'Uy zona(●'◡'●)(❁´◡`❁)');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Get_TRANSACTION;

END PCK_TRANSACTION
    

    




