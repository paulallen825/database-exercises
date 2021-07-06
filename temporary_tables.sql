
#1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.


use germain_1474;

create temporary table employees_with_departments as
select employees.first_name, employees.last_name,departments.dept_name
from employees.employees
join employees.departments;

select * from employees_with_departments
order by dept_name;

#a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
alter table employees_with_departments modify full_name varchar(31);

#b Update the table so that full name column contains the correct data
update employees_with_departments
set full_name = concat (first_name, " ", last_name);

#c Remove the first_name and last_name columns from the table.

alter table employees_with_departments 
drop column first_name;

alter table employees_with_departments 
drop column last_name;

select * from employees_with_departments;

#d Just pulling the names right into the full_name column instead of adding and removing them.

#2 Create a temporary table based on the payment table from the sakila database.
#Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.

use germain_1474;									#setting the correct database

create temporary table New_Sakila as 				#creating the temporary table and adding everything from the table sakilla.payment
select *
from sakila.payment;

alter table New_Sakila modify amount decimal(6,0);	#changing the decimal to allow 6 numbers and no decimal places

update New_Sakila set amount = amount * 100;		#updating the amount column to get it from 2.99 to 299

alter table New_Sakila modify amount integer(6);	#modifying the amount column to now be an intger that will hold up to 6 digits

select * from New_Sakila;							#selecting all the data to make sure it looks right

describe New_Sakila;								#using describe to make sure it shows INT for amount

#3
#Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?
create temporary table dept_average as 
select departments.dept_name,
 avg(salaries.salary) as avg_salary
from employees.employees

join employees.dept_emp using (emp_no)
join employees.salaries using (emp_no)
join employees.departments using (dept_no)

where salaries.to_date >= curdate()
group by dept_name;


select avg(avg_salary) from dept_average;

select avg_salary, avg_salary - (select avg(avg_salary) from dept_average)as 'numerator' from dept_average;
#(select std(avg_salary)from dept_average) as 'denominator'
#from dept_average;

select * from dept_average;


