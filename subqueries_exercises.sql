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
where emp_no in (select emp_no from employees where employees.first_name ='Aamod')
;



#3
#How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select *
from employees
where emp_no in (select emp_no from dept_emp where dept_emp.to_dat < curdate()); #85108

#4
#Find all the current department managers that are female.
select first_name, last_name
from employees
where emp_no in (select emp_no from employees where employees.gender ='F') ;

select * 
from employees 
where employees.gender = 'F' and emp_no in (select emp_no from dept_manager);


#5
#Find all the employees who currently have a higher salary than the companies overall, historical average salary.

select *
from employees
where emp_no in (select emp_no
from salaries
where salary > (select avg(salary) from salaries)); 

select avg(salary) from salaries;

select avg(salary) from salaries where to_date>curdate();

select salary
from salaries
where (select avg(salary) from salaries where to_date>curdate())-(select avg(salary) from salaries) ;

select * 
from employees
where emp_no in (select emp_no from salaries
where (select avg(salary) from salaries where to_date>curdate())-(select avg(salary) from salaries) );qu




#SELECT COUNT(salary)
    #FROM salaries
        #WHERE salaries.to_date >= NOW()
            #AND salary >= (SELECT MAX(salary) FROM salaries WHERE salaries.to_date >= NOW()) - (SELECT STD(salary) FROM salaries WHERE salaries.to_date >= NOW()) ;

 
 
 
 #SELECT ((query that returns 83) / (query that returns 240_124)) * 100 AS percent_of_salaries;