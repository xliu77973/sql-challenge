--List the employee number, last name, first name, sex, and salary of each employee:

SELECT * FROM employees as E
SELECT * FROM salaries

SELECT E.emp_no,E.first_name,E.last_name, E.sex,S.salary FROM employees as E
INNER JOIN salaries AS S ON E.emp_no = S.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986:
SELECT * FROM employees as E

SELECT E.first_name, E.last_name, E.hire_date FROM employees as E
WHERE EXTRACT(YEAR FROM E.hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name:
SELECT * FROM departments as D
SELECT * FROM dept_manager as DM
SELECT * FROM employees as E

SELECT
    D.dept_no,
    D.dept_name,
    E.emp_no,
    E.last_name,
    E.first_name
FROM
    employees e
    INNER JOIN dept_manager DM ON DM.emp_no = E.emp_no
    INNER JOIN departments D ON D.dept_no = DM.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name:
SELECT * FROM departments as D
SELECT * FROM employees as E
SELECT * FROM dept_emp as DE

SELECT
	E.emp_no,
	E.last_name,
	E.first_name,
	D.dept_name,
	DE.dept_no
FROM
	employees E
	INNER JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
	INNER JOIN departments AS D ON DE.dept_no = D.dept_no;
	
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B:
SELECT * FROM employees AS E

SELECT E.first_name, E.last_name, E.sex FROM employees E
WHERE E.first_name = 'Hercules' AND E.last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name:
SELECT * FROM employees AS E
SELECT * FROM departments AS D
SELECT * FROM dept_emp AS DE

SELECT D.dept_name, E.emp_no, E.last_name, E.first_name FROM employees E

INNER JOIN dept_emp DE ON E.emp_no = DE.emp_no
INNER JOIN departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name:
SELECT * FROM employees AS E
SELECT * FROM departments AS D
SELECT * FROM dept_emp AS DE

SELECT D.dept_name, E.emp_no, E.last_name, E.first_name FROM employees E

INNER JOIN dept_emp DE ON E.emp_no = DE.emp_no
INNER JOIN departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name):
SELECT * FROM employees AS E

SELECT E.last_name, COUNT(*) AS frequency FROM employees E
GROUP BY E.last_name
ORDER BY frequency DESC;