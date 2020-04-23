--Q1
SELECT 
emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
--EXTRACT (YEAR FROM emp.hire_date) AS YEAR
from 
 employees as emp, salaries as sal
where
emp.emp_no = sal.emp_no;

--Q2
SELECT 
emp.emp_no, emp.last_name, emp.first_name --emp.gender, sal.salary
from 
employees as emp
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
--Q3
--3. List the manager of each department with the following information: 
--department number,
--department name, 
--the manager's employee number, 
--last name, 
--first name, and 
--start and 
--end employment dates.
;

SELECT 
  dm.dept_no,
  dept.dept_name,
  emp.emp_no,
  emp.last_name, 
  emp.first_name, 
  dm.from_date,
  dm.to_date
from 
 department_manager as dm inner join departments as dept on dm.dept_no=dept.dept_no
 inner join employees as emp on emp.emp_no=dm.emp_no;

--EXTRACT (YEAR FROM emp.hire_date) = 1986

--Q4
SELECT 
  emp.emp_no,
  emp.last_name, 
  emp.first_name,
  dept.dept_name
from 
 employees as emp inner join dept_emp as de on emp.emp_no = de.emp_no inner join departments as dept on de.dept_no = de.dept_no
where dept.dept_name = 'Sales';

--Q5
SELECT 
  emp.last_name, 
  emp.first_name
  --SUBSTRING (emp.last_name, 1, 1)
from 
  employees as emp
where
SUBSTRING (emp.last_name, 1, 1) = 'B' and
emp.first_name = 'Hercules';
--and emp.last_name like 'B%'

--Q6
select 
  emp.emp_no,
  emp.last_name,
  emp.first_name,
  dept.dept_name
from
 employees as emp inner join dept_emp as demp on emp.emp_no = demp.emp_no inner join departments as dept on demp.dept_no = dept.dept_no
where
 emp.emp_no = demp.emp_no and
 dept.dept_no = demp.dept_no and 
 dept.dept_name = 'Sales' and 
 demp.to_date = to_date('9999-01-01','YYYY-MM-DD')
 
--Q7
 select 
  emp.emp_no
  ,emp.last_name
  ,emp.first_name
  ,dept.dept_name
from
 employees as emp,
 departments as dept,
 dept_emp as demp
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
 employees as emp
 group by emp.last_name
 order by count(*) desc;