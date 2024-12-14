-- Task:17) Her departmandaki en yüksek ortalama maaşa sahip çalışanları belirle. Departman adını,
-- çalışanın adını, soyadını ve ortalama maaşı listele. Sonuçları departmanlarına göre azalan şekilde
-- sırala, sadece kendi departmanlarında en yüksek ortalama maaşa sahip olanları göster.

select departments.dept_name  , employees.first_name, employees.last_name , avg(salary) 
from dept_emp 
left join departments ON dept_emp.dept_no = departments.dept_no
left join salaries ON salaries.emp_no = dept_emp.emp_no
left join employees ON  employees.emp_no= dept_emp.emp_no  
group by departments.dept_name
order by salaries.salary desc;






-- Task:18) 1990-01-01 tarihinden önce işe alınan tüm çalışanların adlarını, soyadlarını ve işe alınma
-- tarihlerini alfabetik sırayla listele.

select first_name , last_name, hire_date
from employees
where hire_date < '1990-01-01'
order by first_name, last_name, hire_date;

-- Task:19) 1985-01-01 ile 1989-12-31 tarihleri arasında işe alınan tüm çalışanların adlarını, soyadlarını ve işe
-- alınma tarihlerini işe alınma tarihine göre sıralı olarak listele.

select first_name, last_name, hire_date
from employees
where hire_date between '1985-01-01' and '1989-12-31'
order by first_name ,last_name, hire_date;

-- Task:20) 1985-01-01 ile 1989-12-31 tarihleri arasında işe alınan Satış departmanındaki tüm çalışanların
-- adlarını, soyadlarını, işe alınma tarihlerini ve maaşlarını, maaşa göre azalan şekilde sıralı olarak
-- listele.

select first_name, last_name , hire_date , salary
from dept_emp
left join employees ON employees.emp_no = dept_emp.emp_no
left join departments ON departments.dept_no = dept_emp.dept_no
left join salaries ON salaries.emp_no = dept_emp.emp_no
where hire_date between '1985-01-01' and '1989-12-31'and departments.dept_name='Sales'
order by salary desc;


-- Task:21)  a: Find the count of male employees (179973)
  select count(gender)
  from employees
  where gender='M';

-- b: Determine the count of female employees (120051)
 select count(gender)
 from employees
 where gender='F';
 
-- c: Find the number of male and female employees by grouping:
select count(gender),gender
 from employees
 group by gender;
 
-- d: Calculate the total number of employees in the company (300024)
select count(emp_no) as Total
from employees;
 
-- '10102' numaralı çalışanın en uzun süre çalıştığı departmanı bul

SELECT dept_name as DepartmanAdı, TIMESTAMPDIFF(YEAR, '1985-01-01', '2024-01-01') AS YılSüresi
from dept_emp
left join departments ON dept_emp.dept_no = departments.dept_no
where dept_emp.emp_no='10102'




