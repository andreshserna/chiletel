CREATE OR REPLACE PACKAGE PCK_CUSTOMER IS
/*******************************************************************************
Description: Package to manage data access for Customer records
Author: Team B
Date 22-09-23
Management Id: XD01
@copyright: Seguros Bolívar
*******************************************************************************/

	/* Public data types declaration */

	SUBTYPE tyrcCUSTOMER IS CUSTOMER%ROWTYPE;

	TYPE tytbCUSTOMER IS TABLE OF tyrcCUSTOMER INDEX BY BINARY_INTEGER;

	/* Public variables declaration */



	/* Public methods and functions declaration */

	/*******************************************************************************
	Description: Procedure that inserts a customer object
	Author: Team B
	Date 28-09-23
	Management Id: XD01
	@copyright: Seguros Bolívar
	*******************************************************************************/
	PROCEDURE Proc_Insert_CUSTOMER
	(
		IOp_Customer IN OUT NOCOPY tyrcCUSTOMER
	);


	/*******************************************************************************
	Description: Procedure that obtains all customers
	Author: Team B
	Date 28-09-23
	Management Id: XD01
	@copyright: Seguros Bolívar
	*******************************************************************************/
	PROCEDURE Proc_Get_All_CUSTOMER
	(
		Op_Customer OUT NOCOPY tytbCUSTOMER
	);


	/*******************************************************************************
	Description: Procedure that obtains a customer object
	Author: Team B
	Date 28-09-23
	Management Id: XD01
	@copyright: Seguros Bolívar
	*******************************************************************************/
	PROCEDURE Proc_Get_CUSTOMER
	(
		Ip_Id IN NUMBER,
		Op_Customer OUT NOCOPY tyrcCUSTOMER
	);


	/*******************************************************************************
	Description: Procedure that updates a customer object
	Author: Team B
	Date 28-09-23
	Management Id: XD01
	@copyright: Seguros Bolívar
	*******************************************************************************/
	PROCEDURE Proc_Update_CUSTOMER
	(
		IOp_Customer IN OUT NOCOPY tyrcCUSTOMER
	);

END PCK_CUSTOMER;



CREATE OR REPLACE PACKAGE BODY PCK_CUSTOMER IS

	/* Insert customer */
	PROCEDURE Proc_Insert_CUSTOMER (IOp_Customer IN OUT NOCOPY tyrcCUSTOMER) IS

	BEGIN
		-- Initialize values
		IOp_Customer.customer_id := SEQ_CUSTOMER.NEXTVAL;

		-- Insert value
		INSERT INTO CUSTOMER VALUES /*+PCK_CUSTOMER.Proc_Insert_CUSTOMER*/ IOp_Customer;

	EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20000, 'Error: Valor duplicado en la clave primaria o única [PCK_CUSTOMER.insCUSTOMER]');
		WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR(-20001, SQLCODE || ' => ' || SQLERRM);
	END Proc_Insert_CUSTOMER;


	/* Get all customers */
	PROCEDURE Proc_Get_All_CUSTOMER (Op_Customer OUT NOCOPY tytbCUSTOMER) IS
		CURSOR cur_CUSTOMER IS
		SELECT 
			customer_id, 
			first_name, 
			second_name, 
			last_name, 
			second_last_name,
			birthdate, 
			document, 
			document_type_id, 
			address, 
			email, 
			phone_number,
			password,
			created_at,
			updated_at
		FROM CUSTOMER;
		idx BINARY_INTEGER := 1;

	BEGIN
		FOR rec IN cur_CUSTOMER LOOP
			Op_Customer(idx) := rec;
			idx := idx + 1;
		END LOOP;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_ACCOUNT_TYPE.Proc_Get_CUSTOMER]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
	END Proc_Get_All_CUSTOMER;


	/* Get customer by id */
	PROCEDURE Proc_Get_CUSTOMER (Ip_Id IN NUMBER, Op_Customer OUT NOCOPY tyrcCUSTOMER) IS

		CUSTOM_EXCEPTION EXCEPTION;

		CURSOR cur_CUSTOMER IS
		SELECT 
			customer_id, 
			first_name, 
			second_name, 
			last_name, 
			second_last_name,
			birthdate, 
			document, 
			document_type_id, 
			address, 
			email, 
			phone_number,
			password,
			created_at,
			updated_at
		FROM CUSTOMER
		WHERE /*+PCK_CUSTOMER.Proc_Get_CUSTOMER*/ customer_id = Ip_Id;

	BEGIN
		OPEN cur_CUSTOMER;
		FETCH cur_CUSTOMER INTO Op_Customer;
		CLOSE cur_CUSTOMER;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20150, 'Error: No hay ningun resultado [PCK_ACCOUNT_TYPE.Proc_Get_CUSTOMER]');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
	END Proc_Get_CUSTOMER;


	/* Update customer */
	PROCEDURE Proc_Update_CUSTOMER (IOp_Customer IN OUT NOCOPY tyrcCUSTOMER) IS

	BEGIN

	EXCEPTION
		WHEN OTHERS THEN
			RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);

	END Proc_Update_CUSTOMER;


	/* Updates a customer */
    PROCEDURE Proc_Update_CUSTOMER (IOp_Customer IN OUT NOCOPY tyrcCUSTOMER) IS
        v_updated_record tyrcACCOUNTTYPE;
    BEGIN
        /* Update record */
        UPDATE CUSTOMER
        SET first_name = IOp_Customer.first_name,
			second_name = IOp_Customer.second_name,
			last_name = IOp_Customer.last_name,
			second_last_name = IOp_Customer.second_last_name,
			document_type_id = IOp_Customer.document_type_id
			address = IOp_Customer.address,
			email = IOp_Customer.email,
			phone_number = IOp_Customer.phone_number,
			password = IOp_Customer.password
        WHERE customer_id = IOp_Customer.customer_id;
       
		Proc_Get_CUSTOMER(IOp_Customer.customer_id, v_updated_record);
		IOp_Customer := v_updated_record;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20199, SQLCODE || ' => ' || SQLERRM);
    END Proc_Update_CUSTOMER;

END PCK_CUSTOMER;
