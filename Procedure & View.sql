USE employee;
select * from employee_table;
select * from product_table;
alter table employee_table add date_of_join date;
alter table product_table add expiry_date date;


update employee_table
set date_of_join = '2024-07-02'
where emp_id = 1;

update employee_table 
set date_of_join='2023-09-01'
where emp_id = 2;

update employee_table
set date_of_join='2019-07-09'
where emp_id = 3;

update employee_table
set date_of_join='2018-02-05'
where emp_id= 4;

update employee_table 
set date_of_join = '2024-12-03'
where emp_id = 5;

update employee_table
set date_of_join = '2024-12-03'
where emp_id=6;



update product_table
set expiry_date = '2024-07-02'
where product_ID = 1;

update product_table 
set expiry_date='2023-09-01'
where product_ID = 2;

update product_table
set expiry_date='2019-07-09'
where product_ID = 3;


CREATE VIEW emp_details as
SELECT * from employee_table order by EXTRACT(YEAR FROM date_of_join) ASC LIMIT 1;

drop view emp_details;
SELECT * FROM emp_details;
select * from employee_table;


DELIMITER $$
CREATE PROCEDURE EMP_DETAILS(IN DOJ DATE)
BEGIN
DECLARE
EMP_YEAR INT;
SET EMP_YEAR := YEAR(DOJ);
SELECT * FROM employee_table where YEAR(date_of_join) = EMP_YEAR;
END $$
DELIMITER ;
CALL EMP_DETAILS ('2024-01-01');
