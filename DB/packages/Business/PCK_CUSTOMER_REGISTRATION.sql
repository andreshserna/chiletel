CREATE OR REPLACE PACKAGE PCK_CUSTOMER_REGISTRATION IS
/*******************************************************************************
Description:
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

    /* Public data types declaration */

    

    /*******************************************************************************
    Description: Procedure that inserts a transaction object
    Author: Team B
    Date 28-09-23
    Management Id: XD01
    @copyright: Seguros Bolívar
    *******************************************************************************/
    PROCEDURE Proc_Register_Customer
    (
        IOp_Customer IN OUT NOCOPY PCK_CUSTOMER.tyrcCUSTOMER,
        IOp_Account IN OUT NOCOPY PCK_ACCOUNT.tyrcACCOUNT
    );

END PCK_CUSTOMER_REGISTRATION;

CREATE OR REPLACE PACKAGE BODY PCK_CUSTOMER_REGISTRATION IS

    PROCEDURE Proc_Register_Customer
        (
            IOp_Customer PCK_CUSTOMER.tyrcCUSTOMER,
            IOp_Account PCK_ACCOUNT.tyrcACCOUNT
        ) IS
    BEGIN





    END PROCEDURE Proc_Register_Customer;

END PCK_CUSTOMER_REGISTRATION;
