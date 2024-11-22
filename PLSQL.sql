create database employee;
use employee;
create table employee_table(
emp_ID INT PRIMARY KEY, 
emp_name varchar(20), 
emp_salary DECIMAL(7,2),
emp_city varchar(20)
);
create table product_table(
product_ID int PRIMARY KEY,
product_name varchar (30),
product_price decimal(20,2), 
product_quantity int
);
SELECT * FROM employee_table;

INSERT INTO employee_table VALUES 
(1, 'Jayashree', 50000, 'Chennai'), 
(2, 'Jothika', 70000, 'salem'), 
(3, 'Kavitha', 75000, 'salem'),
(4, 'Mouniga', 60000, 'chennai'),
(5, 'Nirmal', 65000, 'chennai'),
(6, 'Harini', 55000, 'chennai');

INSERT into product_table values
(1, 'Mobile', 25000, 5),
(2, 'Laptop', 45000, 15),
(3, 'Tab', 20000, 10);
select * from product_table;
drop table product_table;
drop table employee_table;


DELIMITER $$

CREATE PROCEDURE GetProductDetails (IN product_id INT)
BEGIN
    SELECT * FROM product_table WHERE product_id = product_id;
END $$

DELIMITER ;
call GetProductDetails(1);

drop procedure GetProductDetails;

DELIMITER $$
CREATE FUNCTION employeedetails(employee_salary INT) RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN 
DECLARE emp2_details VARCHAR(2000);
SELECT CONCAT(emp_id,';',emp_name,';',emp_salary,';') INTO emp2_details  FROM employee_table WHERE emp_salary > employee_salary LIMIT 1;
RETURN emp2_details;
END $$
DELIMITER ;
drop function employeedetails;
CALL employeedetails(200);-- 


DELIMITER $$
CREATE PROCEDURE tableStructure(IN employee_table VARCHAR(255))
BEGIN
	SELECT * from employee_table;
END $$
DELIMITER ;
DROP PROCEDURE tableStructure;
call tableStructure;





DELIMITER $$

CREATE TRIGGER employee_row_count_trigger
AFTER INSERT ON employee_table
FOR EACH ROW
BEGIN
  INSERT INTO row_count_log (table_name, row_count)
  VALUES ('employee_table', (SELECT COUNT(*) FROM employee_table));
END $$

DELIMITER ;



-- DELIMITER $$
-- CREATE TRIGGER AFTER_UPDATE
-- AFTER UPDATE ON employee_table
-- FOR EACH ROW
-- BEGIN
-- select count(*) 


CREATE VIEW chennai_loc as SELECT * from employee_table
WHERE emp_city = 'Chennai';


