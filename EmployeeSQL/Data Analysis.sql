--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, last_name, first_name, sex, salary
FROM employees as a 
INNER JOIN salaries as b
ON b.emp_no = a.emp_no
ORDER BY b.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE extract(year FROM hire_date) =1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT md.dept_no, d.dept_name, md.emp_no, e.last_name, e.first_name
FROM dept_manager md
JOIN employees e
ON md.emp_no = e.emp_no
JOIN departments d
on md.dept_no = d.dept_no
ORDER BY d.dept_name;


--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN 
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
ORDER BY departments.dept_name;


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT last_name, first_name
FROM employees as e 
WHERE (first_name = 'Hercules') AND (LOWER(last_name)) like 'b%'
ORDER BY last_name;

--6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e 
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no) 
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,
COUNT(last_name)
AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;








