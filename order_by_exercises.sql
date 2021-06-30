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
#30723-7330=23393

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







