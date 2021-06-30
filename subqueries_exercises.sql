#1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
select *
from employees
where emp_no in (select emp_no from employees where hire_date = '1990-10-22');

#1 another way
SELECT *
FROM employees
WHERE employees.hire_date = (
SELECT hire_date
FROM employees
WHERE employees.emp_no = '101010');

#2
#Find all the titles ever held by all current employees with the first name Aamod. 
select title
from titles
where emp_no in (select emp_no from employees where employees.first_name ='Aamod');

#3
#How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select *
from employees
where emp_no in (select emp_no from dept_emp where dept_emp.to_date < curdate()); #85108






 