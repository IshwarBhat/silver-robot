/*
- Allows for conditional flow of logic
- Can nest as deep as you like
- Conditions look like WHERE clause of SQL
=, !=, <, >, BETWEEN, calcualtion, IS NULL,
IS NOT NULL, etc

IF <condition> THEN statement[s];
[ELSIF <condition> THEN statement[s];]
[ELSE statement[s];]
END IF;
*/
--Example:
IF    IN_Type = 'C'
THEN
      Converted_Temp := Celsius_to_Farenheit(IN_Temp);
      
      DBMS_OUTPUT.PUT_LINE('Farenheit = ' ||
Converted_Temp);
ELSIF In_Type = 'F'
THEN
      Converted_Temp := Farenheit_to_Celsius(IN_Temp);
      DBMS_OUTPUT.PUT_LINE('Celsius = ' || Converted_Temp);
END IF;

--Lab
set serveroutput on;
DECLARE

v_hours_worked NUMBER(3) := &Hours_Worked;

BEGIN

IF v_hours_worked > 40 THEN
  dbms_output.put_line('You worked overtime');
ELSIF v_hours_worked = 40 THEN
  dbms_output.put_line('You worked a full week');
ELSIF v_hours_worked BETWEEN 20 and 40 THEN
  dbms_output.put_line('Have you been sick?');
ELSIF v_hours_worked < 20 THEN
  dbms_output.put_line('You are part-time help');
END IF;

END;

/*
- CASE
       - Alternative to IF/THEN/ELSE
       -Two formats:
            - Return a variable
            - Runs commands
      
*/
-- Lab
set serveroutput on;
DECLARE

v_hours_worked NUMBER(3) := &Hours_Worked;

BEGIN

CASE
 WHEN v_hours_worked > 40 THEN
  dbms_output.put_line('You worked overtime');
 WHEN v_hours_worked = 40 THEN
  dbms_output.put_line('You worked a full week');
 WHEN v_hours_worked BETWEEN 20 and 40 THEN
  dbms_output.put_line('Have you been sick?');
 WHEN v_hours_worked < 20 THEN
  dbms_output.put_line('You are part-time help');
 ELSE
  dbms_output.put_line('You did not enter a valid number of hours');
 END CASE;
  
END IF;

END;
/



/*
LOOPS
*/
--Lab
set serveroutput on
DECLARE

v_count NUMBER(3) := 0;

BEGIN

FOR v_count IN 1 .. 5
LOOP
      dbms_output.put_line('Ishwar Bhat');
END LOOP;

END;
/



