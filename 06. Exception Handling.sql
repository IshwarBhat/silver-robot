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
