select 
  emp.emp_no,
  emp.last_name,
  emp.first_name,
  dept.dept_name
from
employees as emp inner join dept_emp as demp on emp.emp_no = demp.emp_no
inner join departments dept on demp.dept_no = dept.dept_no
where
--emp.emp_no = demp.emp_no and
--dept.dept_no = demp.dept_no and 
 dept.dept_name = 'Sales' and 
 demp.to_date = to_date('9999-01-01','YYYY-MM-DD');
 
--Q1
SELECT
emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
--EXTRACT (YEAR FROM emp.hire_date) AS YEAR
from 
employees emp, salaries sal
where
emp.emp_no = sal.emp_no;

--Q2
SELECT 
emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary,
EXTRACT (YEAR FROM emp.hire_date) AS YEAR
FROM 
employees as emp LEFT JOIN salaries as sal
ON
	emp.emp_no = sal.emp_no

WHERE hire_date is "1986"
--Q3
--3. List the manager of each department with the following information: 
--department number,
--department name, 
--the manager's employee number, 
--last name, 
--first name, and 
--start and 
--end employment dates.


SELECT 
  dm.dept_no,
  dept.dept_name,
  emp.emp_no,
  emp.last_name, 
  emp.first_name, 
  dm.from_date,
  dm.to_date
from 
 "Pewlett Hackard".employees emp,
 "Pewlett Hackard".dept_manager dm,
 "Pewlett Hackard".departments dept
where
emp.emp_no = dm.emp_no
and dm.dept_no = dept.dept_no;

--EXTRACT (YEAR FROM emp.hire_date) = 1986

--Q4
SELECT 
  emp.emp_no,
  emp.last_name, 
  emp.first_name,
  dept.dept_name
FROM 
 "Pewlett Hackard".employees emp,
 "Pewlett Hackard".dept_emp de,
 "Pewlett Hackard".departments dept
WHERE
emp.emp_no = CAST (de.emp_no AS INTEGER)
AND de.dept_no = dept.dept_no;

--Q5
SELECT 
  emp.last_name, 
  emp.first_name
  --SUBSTRING (emp.last_name, 1, 1)
from 
 "Pewlett Hackard".employees emp
where
SUBSTRING (emp.last_name, 1, 1) = 'B' and
emp.first_name = 'Hercules'
and emp.last_name like 'B%';

--Q6
SELECT 
  emp.emp_no
  ,emp.last_name
  ,emp.first_name
  ,dept.dept_name
from
 "Pewlett Hackard".employees emp,
 "Pewlett Hackard".departments dept,
 "Pewlett Hackard".dept_emp demp
where
 emp.emp_no = demp.emp_no and
 dept.dept_no = demp.dept_no and 
 dept.dept_name = 'Sales' and 
 demp.to_date = to_date('9999-01-01','YYYY-MM-DD');
 
--Q7
select 
  emp.emp_no
  ,emp.last_name
  ,emp.first_name
  ,dept.dept_name
from
 "Pewlett Hackard".employees emp,
 "Pewlett Hackard".departments dept,
 "Pewlett Hackard".dept_emp demp
where
 emp.emp_no = demp.emp_no and
 dept.dept_no = demp.dept_no and 
 (dept.dept_name = 'Sales' or  dept.dept_name = 'Development') and
 demp.to_date = to_date('9999-01-01','YYYY-MM-DD');
 
--Q8
select 
count(*), 
emp.last_name
from 
 "Pewlett Hackard".employees emp
 group by emp.last_name
 order by count(*) desc # sql_challenge
