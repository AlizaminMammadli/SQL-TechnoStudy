-- TASK_27
-- D005 bölümündeki tüm çalışanları ve yöneticileri listele

select* 
from dept_emp
left join dept_manager ON dept_emp.dept_no=dept_manager.dept_no
where dept_emp.dept_no='d005' and dept_manager.dept_no='d005';


-- TASK_28
-- '1994-02-24' tarihinden sonra işe alınan ve 50.000'den fazla kazanan tüm çalışanları listele
select* 
from employees
left join salaries on employees.emp_no=salaries.emp_no
where employees.hire_date >'1994-02-24'
and salaries.salary >'50000';


-- TASK_29
-- "Satış" bölümünde "Yönetici" unvanıyla çalışan tüm çalışanları listele
select*
from departments 
left join dept_manager ON departments.dept_no=dept_manager.dept_no
where departments.dept_no='d007' and dept_manager.dept_no='d007';


--  TASK_30
-- '10102' numaralı çalışanın en uzun süre çalıştığı departmanı bul

SELECT dept_emp.emp_no, from_date, to_date, departments.dept_name ,
       TIMESTAMPDIFF(YEAR, dept_emp.from_date, dept_emp.to_date) AS Years
FROM dept_emp
left join departments ON departments.dept_no = dept_emp.dept_no 
WHERE emp_no = '11102' and TIMESTAMPDIFF(YEAR, dept_emp.from_date, dept_emp.to_date)
ORDER BY dept_emp.from_date;


-- TASK_31
-- D004 bölümünde en yüksek maaş alan çalışanı bulun
select  departments.dept_no ,employees.first_name ,employees.last_name, salary
from salaries
left join employees ON employees.emp_no = salaries.emp_no
left join dept_emp ON employees.emp_no = dept_emp.emp_no
left join departments ON departments.dept_no =dept_emp.dept_no
where departments.dept_no='d004' order by salaries.salary desc limit 1; -- and (select max(salary));



