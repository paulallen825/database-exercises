#1
#Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

select
emp_no,
dept_emp.dept_no,
hire_date,
if (dept_emp.to_date > curdate(), true, false) as'Is_Current_employee'
from employees
join dept_emp using (emp_no)
order by emp_no;

#2
#Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT
	CONCAT(first_name, ' ', last_name) AS employee_name,
	CASE
		WHEN LEFT(last_name, 1) IN('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;

#3
#How many employees (current or previous) were born in each decade?

SELECT
	CASE
		WHEN birth_date LIKE '194%' THEN '40s'
		 WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '196%' THEN '60s'
		WHEN birth_date LIKE '197%' THEN '70s'
		ELSE 'YOUNG'
	END AS decade,
	COUNT(*) as num_of_bdays
FROM employees
GROUP BY decade;