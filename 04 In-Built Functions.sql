--Arithmetic functions
select 12345/100, round(12345/100,1), round(12345/100,-1) from dual;

select 12345/100, trunc(12345/100,1), trunc(12345/100,-1) from dual;

select date_awarderd, round(date_awarded, 'YYYY'), trunc(date_awarded, 'YYYY') from employee_awards;

select login_count, login_count/4, mod(login_count/4) from employees;

--Date Functions:
select sysdate from dual; --current date (date datatype); default date format in Oracle

select current_timestamp from dual; -- (timestamp datatype w/ local timezone)

select last_name, months_between(last_login_date, signup_date) from employees; -- months_between function

select first_name, signup_date, add_months(signup_date, 6) from employees; -- add_months function


Date-to-Character Conversions:

select date-awarded, to_char(date_awarded, 'DD-MON-YYYY HH:MI:SS') from employee_awards; -- converting a date to a character
select date-awarded, to_char(date_awarded, 'Month DD, YYYY HH24:MI:SS') from employee_awards;
select date-awarded, to_char(date_awarded, 'MM/DD/YYYY') from employee_awards;


Character-to-Date Conversion:
-- legacy or mainframe systems might use string types for date

select '01-JAN-2001' from dual; -- it's a string here

select to_date('01-JAN-2001', 'DD-MON-YYYY') from dual;
select to_date('January 1, 2001', 'Month DD, YYYY') from dual;
select to_date('January 1, 2001 23:04:18', 'Month DD, YYYY HH24:MI:SS') from dual;