--Details of each employee: employee number, last name, first name, gender, and salary.

SELECT emp.emp_no, last_name, first_name, gender, salary 
FROM employee AS emp 
INNER JOIN salaries AS sal
ON emp.emp_no=sal.emp_no
ORDER BY emp.emp_no;

--Drop view emp_details;

--Creating a view emp_details

CREATE VIEW emp_details AS
SELECT emp.emp_no,last_name, first_name, dep.dept_name
FROM employee AS emp
JOIN dept_emp AS de
ON emp.emp_no=de.emp_no
	JOIN departments AS dep
	ON de.dept_no=dep.dept_no
ORDER BY emp.emp_no;

--Department of each employee with the following information: employee number, last name, first name, and department name.
SELECT *
FROM emp_details;

--Employees whose first name is "Hercules" and last names begin with "B"
SELECT emp_no, last_name, first_name, gender
FROM employee
WHERE last_name LIKE 'B%' 
AND first_name='Hercules';

--All employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * 
FROM emp_details
WHERE dept_name='Sales';

--All employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * 
FROM emp_details 
WHERE dept_name='Sales' OR dept_name='Development';

--The frequency count of employee last names, i.e., how many employees share each last name, in descending order.
SELECT last_name, COUNT(emp_no) AS "frequency_of_last_name"
FROM employee
GROUP BY last_name
ORDER BY "frequency_of_last_name" DESC;

--Employees who were hired in 1986.
SELECT * 
FROM employee
WHERE date_part('year',hire_date)=1986;

--The manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dm.dept_no, dep.dept_name, dm.emp_no, emp.last_name, emp.first_name, dm.from_date, dm.to_date
FROM employee AS emp
RIGHT JOIN dept_manager AS dm
ON emp.emp_no=dm.emp_no
LEFT JOIN departments AS dep
ON dm.dept_no=dep.dept_no;