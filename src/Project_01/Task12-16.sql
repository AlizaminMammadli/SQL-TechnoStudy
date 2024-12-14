-- Find the employee with the highest salary - En yüksek maaşa sahip çalışanı bul. 
use employees;
SELECT emp_no, salary
FROM salaries
ORDER BY salary DESC
LIMIT 1;

-- Find the latest salaries for each employee - Her çalışanın en son maaşlarını bul.
SELECT s1.emp_no, s1.salary, s1.from_date, s1.to_date
FROM salaries AS s1
JOIN (
    SELECT emp_no, MAX(to_date) AS max_date
    FROM salaries
    GROUP BY emp_no
) AS s2 ON s1.emp_no = s2.emp_no AND s1.to_date = s2.max_date;

--List the first name, last name, and highest salary of employees in the "Sales" department.
-- Order the list by highest salary descending and only show the employee with the highest salary.
--"Satış" departmanındaki çalışanların adını, soyadını ve en yüksek maaşını listele.
-- Listeyi en yüksek maaşa göre azalan şekilde sırala ve sadece en yüksek maaşa sahip çalışanı göster.
SELECT e.first_name, e.last_name, MAX(s.salary) AS highest_salary
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales'
GROUP BY e.emp_no, e.first_name, e.last_name;

-- Find the Employee with the Highest Salary Average in the Research Department
-- Araştırma Departmanındaki Ortalama En Yüksek Maaşlı Çalışanı Bul
SELECT e.emp_no, e.first_name, e.last_name, AVG(s.salary) AS average_salary
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Research'
GROUP BY e.emp_no, e.first_name, e.last_name
ORDER BY average_salary DESC
LIMIT 1;

-- 16. Her departman için, kaydedilmiş en yüksek tek maaşı belirle. 
-- Departman adını, çalışanın adını, soyadını ve en yüksek maaş tutarını listele. 
-- Sonuçları en yüksek maaşa göre azalan şekilde sırala
WITH MaxSalaries AS (
  SELECT s.emp_no, MAX(s.salary) AS peak_salary
  FROM employees.salaries s
  GROUP BY s.emp_no
)
SELECT d.dept_name, e.first_name, e.last_name, ms.peak_salary
FROM employees.departments d
JOIN employees.dept_emp de ON d.dept_no = de.dept_no
JOIN employees.employees e ON de.emp_no = e.emp_no
JOIN MaxSalaries ms ON e.emp_no = ms.emp_no
ORDER BY ms.peak_salary DESC
LIMIT 2000;
