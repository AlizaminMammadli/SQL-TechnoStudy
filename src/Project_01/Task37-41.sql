-- 37. Her çalışanın en son unvan bilgisini bulma
SELECT emp_no, title, from_date
FROM employees.titles
WHERE to_date = '9999-01-01';

-- 38. 'D005' bölümünde yöneticilerin adını ve soyadını bulma
SELECT e.first_name, e.last_name
FROM employees.employees e
JOIN employees.dept_manager dm ON e.emp_no = dm.emp_no
WHERE dm.dept_no = 'd005';

-- 39. Çalışanları doğum tarihlerine göre sıralama
SELECT *
FROM employees.employees
ORDER BY birth_date;

-- 40. Nisan 1992'de işe alınan çalışanları listeleme
SELECT emp_no, first_name, last_name, gender, hire_date
FROM employees.employees
WHERE hire_date BETWEEN '1992-04-01' AND '1992-04-30'
ORDER BY hire_date ASC;

-- 41. '10102' numaralı çalışanın çalıştığı tüm bölümleri bulma
SELECT DISTINCT e.first_name, e.last_name, d.dept_name
FROM employees.dept_emp de
JOIN employees.employees e ON de.emp_no = e.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
WHERE de.emp_no = '10102';

