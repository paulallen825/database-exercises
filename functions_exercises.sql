describe employees;
#2
select first_name
from employees
where first_name in ('Irena', 'Vidya','Maya'); #709
#3
select first_name
from employees
where first_name = 'irena'
	or first_Name = 'vidya'
	or first_name = 'maya'; #709 yes
#4	
select first_name, gender
from employees
where gender = 'M'
 and (
 first_name = 'irena'
	or first_Name = 'vidya'
	or first_name = 'maya');#441

#5 
select first_name, last_name
from employees
where last_name like 'e%'; #7330
#6
select first_name, last_name
from employees
where last_name like 'e%' or last_name like '%e'; #30723
#6b
#
select first_name, last_name
from employees
where last_name like 'e%' and (last_name not like '%e');
#7
select first_name, last_name
from employees
where last_name like 'e%' and last_name like '%e'; #899
#7b
select first_name, last_name
from employees
where last_name like '%e';#24292
#8
select first_name, last_name, hire_date
from employees
where hire_date like '199%';#135214
#9
select first_name, last_name, birth_date
from employees
where birth_date like '19%%-12-25'; #842
#10
select first_name, last_name, hire_date,birth_date
from employees
where hire_date like '199%' and birth_date like '19%%-12-25';#362
#11
select * 
from employees
where last_name like '%q%';#1873
#12
select *
from employees
where last_name like '%q%' and (last_name not like '%qu%');#547

#OrderBy
#2
select *
from employees
where first_name in ('Irena', 'Vidya','Maya')
order by first_name;#Irena,Reutenauer, Vidya Simmen
#3
select *
from employees
where first_name in ('Irena', 'Vidya','Maya')
order by first_name, last_name;#Irena Acton, Vidya Zweizig
#4
select *
from employees
where first_name in ('Irena', 'Vidya','Maya')
order by last_name, first_name;#Irena Acton, Maya Zyda
#5
select *
from employees
where last_name like 'e%' and last_name like '%e'
order by emp_no;#899, 10021 Ramzi Erde, 499648 Tadahiro Erde
#6
select *
from employees
where last_name like 'e%' and last_name like '%e'
order by hire_date desc;# 899, Teiji Eldridge, Sergi Erde
#7
select first_name, last_name, hire_date,birth_date
from employees
where hire_date like '199%' and birth_date like '19%%-12-25'
order by birth_date asc, hire_date desc; #362, Khun Bernini, Douadi Pettis

#Limit Exercises
#2
SELECT DISTINCT last_name FROM employees
order by last_name desc limit 10; #zykh, zyda, zwicker, zweizig, zumaque, zultner, zucker, zuberek, zschoche, zongker
#3
select *
from employees
where hire_date like '199%' and birth_date like '19%%-12-25'
order by hire_date limit 5;
#Alselm	Cappello		
#Utz Mandell	M	
#Bouchung Schreiter	M		
#Baocai	Kushner	F	
#Petter	Stroustrup	M	
#4
select *
from employees
where hire_date like '199%' and birth_date like '19%%-12-25'
order by hire_date limit 5 offset 45;
#limit is how many results per page and offset is how many results to skip to go to a page. so the it would be offset\limit = page number. 

#Functions
#2
select concat(first_name,last_name) as full_name
from employees
where last_name like 'e%e';
#3
select upper(concat(first_name," ",last_name)) as full_name
from employees
where last_name like 'e%e';
#4
select datediff(curdate(),hire_date) as no_days_at_company
from employees
where hire_date like '199%' and birth_date like '19%%-12-25';
#5
select max(salary) as max_salary, min(salary) from salaries as min_salary;
#6
SELECT LOWER(CONCAT(
		SUBSTR(first_name, 1, 1),
		SUBSTR(last_name, 1, 4),
        '_',
        SUBSTR(birth_date, 6, 2),
        SUBSTR(birth_date, 3, 2))) AS username,
	first_name,
    last_name,
    birth_date
FROM employees;


#elect lower(concat(
    #substr(first_name, 1, 1), # first initial of first name
    #substr(last_name, 1, 4), # first 4 of last name
		# "_",
		 #substr(hire_date, 6, 2), # month
		# substr(hire_date, 3, 2) # 2 yr
#)) as username,first_name, last_name, birth_date
#from employees


