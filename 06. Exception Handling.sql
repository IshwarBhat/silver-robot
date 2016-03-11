/*
- Graceful handling of certain conditions
- Allows PL/SQL to go to normal end-of-lob
	- Then DBMS_OUTPUT can be displayed
- Several pre-determined exceptions
- Can create your own exceptions
*/
-- Basic Syntax
/*
BEGIN
[statements];
EXCEPTION
	WHEN exception [OR exception ...] THEN
		Statement[s];
	[WHEN [...]]
	[WHEN OTHERS THEN
		Statement[s];]
END;
*/
DECLARE
	emp_rec emp%ROWTYPE;
BEGIN
	SELECT *
	into EMP_REC
	FROM EMP;
DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.ename);
EXCEPTION
when NO_DATA_FOUND then
	dbms_output.put_line('No data found');
when TOO_MAY_ROWS then
	dbms_output.put_line('Too many rows found');
END;
/
-- Implicit and Explicit exceptions
/*
Implicit: Automatic e.g. NO_DATA_FOUND, ZERO_DIVIDE, TOO_MANY_ROWS etc
*/

DECLARE
	v_ename varchar2(20);

	my_too_many_rows EXCEPTION;

BEGIN
	SELECT 	ename
	into V_ENAME
	FROM emp;

DBMS_OUTPUT.PUT_LINE('Employee: ' || v_ename);
EXCEPTION
when NO_DATA_FOUND then
	dbms_output.put_line('No Data Found');
when OTHERS then
dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);
END;
/
--Oracle Error: -1422 ORA-01422: exact fetch returns more than requested number of rows

DECLARE
	v_ename varchar2(20);

	my_too_many_rows EXCEPTION;
	PRAGMA EXCEPTION_INT(my_too_many_rows, -1422);
BEGIN
	SELECT 	ename
	into V_ENAME
	FROM emp;

DBMS_OUTPUT.PUT_LINE('Employee: ' || v_ename);
EXCEPTION
when NO_DATA_FOUND then
	dbms_output.put_line('No Data Found');
when my_too_many_rows then
	dbms_output.put_line('Too many rows encountered...');
when OTHERS then
dbms_output.put_line('Oracle Error: ' || SQLCODE || ' ' || SQLERRM);
END;
/

--Oracle Built-In Features
--dbms_utility.format_error_backtrace
--10g+ features: dbms_utility.format_call_stack; dbms_utility.format_error_stack

-- User-defined exceptions
/*
- Need to be explicitly declared and raised
*/

IF v_sal > 2500 then
	RAISE MAKES_TOO_MUCH;
END IF;

EXCEPTION
when MAKES_TOO_MUCH then
	dbms_output.put_line('This person is overpaid!');

--Application defined exception
DECLARE
	MAKES_TOO_MUCH EXCEPTION;

BEGIN
IF v_sal > 2500 then
	RAISE MAKES_TOO_MUCH;
END IF;

EXCEPTION
when MAKES_TOO_MUCH then
	RAISE_APPLICATION_ERROR(-20000, 'This person is overpaid!')

END;

-- Lab
