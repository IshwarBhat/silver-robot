/*
Procedure - Much like an anonymous block

*/

CREATE OR REPLACE PROCEDURE get_last_name(
	 p_first_name IN employees.last_name%TYPE,
	 p_last_name OUT employees.last_name%TYPE )
	AS
		BEGIN
		SELECT last_name
			INTO p_last_name
			FROM employees
			WHERE first_name = p_first_name;
		EXCEPTION
			WHEN NO_DATA_FOUND
			THEN
				DBMS_OUTPUT.PUT_LINE(p_first_name || ' ain''t here.');
			WHEN TOO_MANY_ROWS
			THEN
				DBMS_OUTPUT.PUT_LINE('Too many ' || p_first_name || ' in here.');
			END get_last_name;

-- Call:
DECLARE
	v_last_name employees.last_name%TYPE;
BEGIN

	Get_last_name('Joe', v_last_name);
	
	DBMS_OUTPUT.PUT_LINE('Always writes: ' || v_last_name);

END
