--M7 script

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE MANAGER_ID = 114

SELECT EMPLOYEE_ID, SALARY FROM EMPLOYEES
WHERE SALARY > 11999

SELECT JOB_TITLE FROM JOBS
WHERE JOB_ID IN('AC_MGR', 'IT_PROG')

SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IS NULL

SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID FROM COUNTRIES
WHERE REGION_ID = 1

SELECT EMPLOYEE_ID, START_DATE, END_DATE FROM JOB_HISTORY
WHERE EMPLOYEE_ID IN('102', '101', '176') OR END_DATE = 'DEC 31, 1998'

SELECT * FROM EMPLOYEES
WHERE JOB_ID IN('AD_PRES')

SELECT COUNT(JOB_ID) FROM EMPLOYEES
WHERE JOB_ID IN('SA_REP', 'ST_CLERK')
GROUP BY JOB_ID
ORDER BY JOB_ID

SELECT JOB_ID, AVG(SALARY) FROM EMPLOYEES
HAVING AVG(SALARY) > 10000
GROUP BY JOB_ID

SELECT SALARY, COUNT(SALARY) "NUMBER_OF_PERSONS" FROM EMPLOYEES
GROUP BY SALARY
ORDER BY SALARY ASC

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('MK_ASST', 'Marketing Assistant', 3000, 13000)

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id)
VALUES (500, 'Alicia', 'Santos', 'ASANTOS', '650.124.0000', '03/24/1999', 'MK_ASST', 10000, 20)

UPDATE EMPLOYEES
SET LAST_NAME = 'Delos Santos', SALARY = 12500
WHERE EMPLOYEE_ID = 500;

SAVEPOINT SPEmp500;

delete from employees
where employee_id = '500'

rollback

CREATE VIEW EMPLOYEE AS SELECT * FROM EMPLOYEES


--M8 script

SELECT LOCATION_ID, STREET_ADDRESS, CITY, STATE_PROVINCE, COUNTRY_NAME
FROM LOCATIONS NATURAL JOIN COUNTRIES

SELECT LAST_NAME, DEPARTMENT_ID, DEPARTMENT_NAME
FROM EMPLOYEES
JOIN DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
JOIN locations l
ON (d.location_id = l.location_id)
WHERE LOWER(l.city) = 'toronto';

SELECT w.last_name "Employee", w.employee_id "Emp#",
       m.last_name "Manager", m.employee_id "Mgr#"
FROM employees w JOIN employees m
ON (w.manager_id = m.employee_id);

SELECT w.last_name "Employee", w.employee_id "Emp#",
       m.last_name "Manager", m.employee_id "Mgr#"
FROM employees w LEFT JOIN employees m
ON (w.manager_id = m.employee_id);

SELECT e.department_id as "DEPARTMENT", e.last_name as "EMPLOYEE", e2.last_name as "COWORKER"
FROM employees e JOIN employees e2
ON (e.department_id = e2.department_id)
WHERE e.employee_id <> e2.employee_id
ORDER BY e.department_id, e.last_name, e2.last_name;

DESC JOB_GRADES

SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN  job_grades j ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);

select last_name, hire_date
from employees
where department_id =
(select department_id from employees where last_name like :vlname) and last_name <> :vlname

select employee_id, last_name, salary from employees
where salary > (select avg(salary) from employees)
order by salary;

SELECT EMPLOYEE_ID, LAST_NAME FROM EMPLOYEES
WHERE LAST_NAME LIKE '%u%'

select last_name, department_id, job_id
from employees
where department_id in (select department_id from departments where location_id = :vLocation)

select last_name, salary
from employees
where manager_id in (select employee_id from employees where last_name='King');

select department_id, last_name, job_id from employees
where department_id in (select department_id from departments where department_name = 'Executive');
