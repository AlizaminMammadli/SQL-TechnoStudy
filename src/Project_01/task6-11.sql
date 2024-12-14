-- 6. Maaşı 70.000'den yüksek olan "Satış" departmanındaki tüm çalışanları listele
SELECT * FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
JOIN employees.salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales' AND s.salary > 70000;

-- 7. Maaşı 50.000 ile 100.000 arasında olan çalışanları getir
SELECT * FROM employees.salaries
WHERE salary BETWEEN 50000 AND 100000;

-- 8. Her departmanın ortalama maaşını hesapla
SELECT  AVG(s.salary) AS average_salary
FROM employees.departments d
JOIN employees.dept_emp de ON d.dept_no = de.dept_no
JOIN employees.salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name;

-- 9. Departman adlarını da içeren her departmanın ortalama maaşını hesapla
SELECT d.dept_name, AVG(s.salary) AS average_salary
FROM employees.departments d
JOIN employees.dept_emp de ON d.dept_no = de.dept_no
JOIN employees.salaries s ON de.emp_no = s.emp_no
GROUP BY d.dept_name;

-- 10. '10102' iş numarasına sahip çalışanın tüm maaş değişikliklerini bul
SELECT * FROM employees.salaries
WHERE emp_no = '10102';

-- 11. '10102' iş numarasına sahip çalışanın maaş artışlarını bul ('to_date' sütununu kullanarak)
SELECT * FROM employees.salaries
WHERE emp_no = '10102' AND to_date = '9999-01-01';