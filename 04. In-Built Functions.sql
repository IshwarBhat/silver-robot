--Base String function
select street_address, length(street_address) from addresses;
select street_address, length(street_address) from addresses where length(street_address) > 15;

select last_name, lpad(last_name, 12, ' ') from employees; -- lpad - three arguments, space is the padding. Right-justifies with a total width of 12
select first_name, rpad(first_name, 9, '*') from employees;

select website_url, ltrim(website_url, 'http://') from websites;

select concat(first_name, last_name) from employees; -- concat takes only 2 arguments. Double pipe (||) is more commonly used.

--Numeric Conversion
select 1+1 from dual; -- gives numeric value of 2
select to_number('1') + to_number('1') from dual; -- converts string to number and then add.

select '1' + '1' from dual; -- works! ('a' + 'b' throws error)

select last_name, to_number(to_char(signup_date, 'YYYY')) - to_number(to_char(start_date, 'YYYY')) years_between from employees;

select to_number('$20,000.00', '$99,999.99') from dual;

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
