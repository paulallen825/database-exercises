# 1 Use the join_example_db. Select all the records from both the users and roles tables.

select * 
from users
join roles on roles.id = users.role_id;

#2Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
#left join
select * 
from users
left join roles on roles.id = users.role_id; 

#right join
select * 
from users
right join roles on roles.id = users.role_id;


#3
select roles.name as Current_Roles,
count(role_id) as no_emp
from users
right join roles on roles.id = users.role_id
group by Current_Roles;



#employee data base 

#2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
#list out tables- departments, employees
#What keys they have in common?
# None in common, so we look for a joiner table-dept_manager
#stables departments, dept_manager, employees

#start with select * on the first tables

#determine the type of join needed

select dept_name as "Department Name", 
   concat(first_name, " ", last_name) as "Current Manager Name"
from departments
join dept_manager using (dept_no)
join employees using (emp_no)
where dept_manager.to_date > curdate();

#3 Find the name of all departments currently managed by women.

select dept_name as "Department Name", 
   concat(first_name, " ", last_name) as "Current Manager Name"
from departments
join dept_manager using (dept_no)
join employees using (emp_no)
where dept_manager.to_date > curdate()
and employees.gender = 'f'; #added the addtional clause to search for female gender

#4 Find the current titles of employees currently working in the Customer Service department.

select title, count(*)  -- selecting the title column and setting it to count
from titles				-- selecting it from the titles table
join dept_emp using (emp_no) -- joining the dept_emp it has emp_no and dept_no
join departments using (dept_no) -- joining the departments, it has dept_no and departments
where titles.to_date >= now()    -- making sure the titles are for current employees
and dept_emp.to_date >= now()	 -- making sure dept_employees are current 
and departments.dept_name = 'Customer Service' -- setting the search to only customer service
group by title								   -- grouping it by title to get all titles in rows
order by title;								   -- ordering it by title to get alphabetical ordering

#5 Find the current salary of all current managers.
select
dept_name as "Department Name", 
concat(first_name, " ", last_name) as "Current Manager Name",
salary
from departments
join dept_manager using (dept_no)
join employees using (emp_no)
join salaries using (emp_no) 
where dept_manager.to_date > curdate()
and salaries.to_date > curdate();

#6
#Find the number of current employees in each department.

select dept_no,
dept_name,
count(*) as num_employees
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
where dept_emp.to_date >curdate()
group by dept_no
order by dept_no;

#7 Which department has the highest average salary? Hint: Use current not historic information.

select dept_no,
dept_name,
avg(salaries.salary) as average_salary
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
join salaries using (emp_no)
where dept_emp.to_date >curdate()
and salaries.to_date >curdate()
group by dept_name
order by average_salary desc
limit 1;

#8 Who is the highest paid employee in the Marketing department?
select first_name, 
last_name, 
dept_name, 
salary
from employees
join dept_emp using (emp_no)
join departments using (dept_no)
join salaries using (emp_no)
where dept_name = 'marketing'
and dept_emp.to_date >now()
and salaries.to_date >now()
order by salary desc
limit 1;

#9

select
dept_name as "Department Name", 
concat(first_name, " ", last_name) as "Current Manager Name",
salary
from departments
join dept_manager using (dept_no)
join employees using (emp_no)
join salaries using (emp_no) 
where dept_manager.to_date > curdate()
and salaries.to_date > curdate()
order by salary desc
limit 1;

#10




