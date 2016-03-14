/*
Procedure - To perform an action
Function - Intended to return a value (To return a single value)
*/

CREATE OR REPLACE FUNCTION BUSINESS_DAYS(
	p_START_DATE IN DATE
	P_END_DATE IN DATE
	P_DEBUG IN VARCHAR2 DEFAULT 'FALSE' )
RETURN NUMBER
AS
	v_loop_increment NUMBER := 0;
	v_days_increment NUMBER := 0;
BEGIN
	LOOP
		EXIT WHEN p_start_date + v_loop_increment > p_end_date;
		IF to_number(to_char(p_start_date + v_loop_increment, 'd'))
			IN (2,3,4,5,6)
		THEN

			v_days_increment := v_days_increment + 1;

			if p_debug != 'FALSE'
			THEN
				dbms_output.put_line(to_char(p_start_date + v_loop_increment, 'FMDay DD "of" Month, YYYY'));
			END IF;
		END IF;

		v_loop_increment := v_loop_increment + 1;

	END LOOP;

	RETURN v_days_increment;

END BUSINESS_DAYS;

	--Using the function:

declare
	v_business_days NUMBER;
begin
	v_business_days := 
		business_days(
			p_start_date => to_date( '22-DEC-2012', 'DD-MON-YYYY'),
			p_end_date => to_date( '03-JAN-2013', 'DD-MON-YYYY'),
			p_debug => 'FALSE'
		);

	dbms_output.put_line(v_business_days);

end;

DECLARE

	v_increment NUMBER := 3;

	FUNCTION modit(
		p_dividend IN NUMBER,
		p_divisor IN NUMBER )
	RETURN BOOLEAN
	AS
	BEGIN
		RETURN (mod(p_dividend,p_divisor) = 0);
	END;

BEGIN

	FOR I IN REVERSE 1..10
	LOOP
		IF modit(i,v_increment)
		THEN
			dbms_output.put_line(i);
		END IF;
	END LOOP;
END;
