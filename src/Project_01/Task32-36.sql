     -- 32. Find the entire position history for employee with emp. no '10102'
 -- '10102' numaralı çalışanın tüm pozisyon geçmişini bulun
     -- 33. Finding the average "employee age"
 -- Ortalama "çalışan yaşını" bulma
     -- 34. Finding the number of employees per department
 -- Bölüm başına çalışan sayısını bulma
     -- 35. Finding the managerial history of employee with ID (emp. no) 110022
 -- 110022 numaralı çalışanın yönetim geçmişini bulma
     -- 36. Find the duration of employment for each employee
 -- Her çalışanın istihdam süresini bulma
 
 select * from departments;
 select * from dept_emp;
 select * from dept_manager;
 select * from employees;
 select * from salaries;
 select * from titles;
 
-- 32 --------------------------------
 select first_name,last_name,titles.*
 from titles
 left join employees ON titles.emp_no=employees.emp_no
 where titles.emp_no=10102;
 
-- 33 --------------------------------
  select avg(2024 - substr(birth_date,1, 4)) as AverageAge
from employees;
 
-- 34 --------------------------------
select dept_no, count(*) as TotalEmployee
from dept_emp
group by dept_no;

-- 35 --------------------------------
select dept_manager.emp_no,first_name ,last_name,dept_name,from_date,to_date
from dept_manager
left join employees ON employees.emp_no=dept_manager.emp_no
left join departments ON departments.dept_no=dept_manager.dept_no
where dept_manager.emp_no= 110022;

-- 36 --------------------------------
 select*, (2024-substr(hire_date,1, 4)) as DurOfEmployement
 from employees;
 

 