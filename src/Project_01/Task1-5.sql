-- 1. List all employees in department D001.
-- D001 departmanındaki tüm çalışanları listele. 

use employees;
select * from dept_emp
where dept_no='d001' 
order by emp_no;


-- 2. List all employees in 'Human Resources' department.
-- 'İnsan Kaynakları' departmanındaki tüm çalışanları listele.

select * from dept_emp
where dept_no='d003' 
order by emp_no;


-- 3. Calculate the average salary of all employees
-- Tüm çalışanların ortalama maaşını hesapla.

select avg(salary) as averageSallary from salaries;


-- 4. Calculate the average salary of all employees with gender "M"
-- "Erkek" cinsiyetindeki tüm çalışanların ortalama maaşını hesapla.

select employees.employees.gender, avg(salaries.salary) as averageSallary
from salaries
join employees.employees ON salaries.emp_no = employees.employees.emp_no
where employees.employees.gender = 'M' ;


-- 5. Calculate the average salary of all employees with gender "F"
-- "Kadın" cinsiyetindeki tüm çalışanların ortalama maaşını hesapla.

select employees.employees.gender, avg(salaries.salary) as averageSallary
from salaries
join employees.employees ON salaries.emp_no = employees.employees.emp_no
where employees.employees.gender = 'F' ;




