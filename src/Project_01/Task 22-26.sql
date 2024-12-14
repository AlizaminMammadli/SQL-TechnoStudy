-- TASK-22) a: Find out how many employees have unique first names (1275)
-- Kaç çalışanın benzersiz ilk adı olduğunu bulun (1275)
Select count(DISTINCT first_name) as Benzersiz_isim
from employees;

-- b: Identify the number of distinct department names (9)
-- Farklı bölüm adlarının sayısını belirleyin (9)

select count(DISTINCT dept_no) from departments;

-- TASK-23) Her bölümdeki çalışan sayısını listele

Select departments.dept_name , count(DISTINCT employees.emp_no) as EmpoleyeeNumber
from dept_emp
left join employees On dept_emp.emp_no= employees.emp_no
left join departments On dept_emp.dept_no= departments.dept_no
group by departments.dept_name;


-- TASK-24) 1990-02-20 tarihinden sonraki son 5 yıl içinde işe alınan tüm çalışanları listele

select *
from employees
where hire_date between '1990-02-20' and '1995-02-20';

-- TASK-25)"Annemarie Redmiles" adlı çalışanın bilgilerini (çalışan numarası, doğum tarihi, ilk adı, soyadı,
-- cinsiyet, işe alınma tarihi) listele.

select emp_no,birth_date,first_name,last_name,gender,hire_date
from employees
where first_name='Annemarie' and last_name='Redmiles';

-- TASK-26) "Annemarie Redmiles" adlı çalışanın tüm bilgilerini (çalışan numarası, doğum tarihi, ilk adı,
-- soyadı, cinsiyet, işe alınma tarihi, maaş, departman ve unvan) listele.

select employees.emp_no, birth_date, first_name, last_name, gender, hire_date, salaries.salary, departments.dept_name, titles.title
from dept_emp
left join employees on employees.emp_no= dept_emp.emp_no
left join departments on departments.dept_no= dept_emp.dept_no
left join titles on titles.emp_no= dept_emp.emp_no
left join salaries on salaries.emp_no= dept_emp.emp_no
where first_name='Annemarie' and last_name='Redmiles';
