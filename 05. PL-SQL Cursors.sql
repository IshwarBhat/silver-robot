/*
- Temporary work areas for your result set in Oracle

- Implicit cursors:
	- For any SELECT(1-row variety), or DML
-Explicit cursors:
	- Handle more than one row

*/

DECLARE

v_row_count NUMBER(3) := 0;

BEGIN

UPDATE emp
	set sal = sal * 1.1
	where deptno = 10;

IF SQL%FOUND THEN
	dbms_output.put_line('Updated Rows: ' || SQL%ROWCOUNT);
END IF;

IF SQL%NOTFOUND THEN
	dbms_output.put_line('No Rows Updated');
END IF;

End;
/

--Explore Explicit Cursors

--Lab
DECLARE
cursor emp_cur is
select ename, sal
from emp;

emp_rec emp_cur%ROWTYPE;

BEGIN
open emp_cur;

fetch emp_cur into emp_rec;

while emp_cur%FOUND
loop
	dbms_output.put_line('Employee ' || emp_rec.ename || ' makes ' || emp_rec_sal);
	fetch emp_cur into emp_reec;
end loop;

close emp_cur;
