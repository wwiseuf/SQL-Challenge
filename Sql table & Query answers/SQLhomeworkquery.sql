/*List the following details of each employee: employee number, last name, first name, sex, and salary.*/
select employees.last_name, employees.first_name, employees.sex, salaries.salary, employees.emp_no
from employees 
inner join salaries
on salaries.emp_no = employees.emp_no;

/*List first name, last name, and hire date for employees who were hired in 1986.*/
select employees.first_name, employees.last_name, employees.hire_date
from employees
where extract(year from hire_date)= '1986'
order by hire_date nulls last;

/*List the manager of each department with the following information: department number, department name, 
  the manager's employee number, last name, first name.*/
select dept_managers.dept_no, departments.dept_name, dept_managers.emp_no, employees.last_name, employees.first_name
from dept_managers
left join departments
on dept_managers.dept_no = departments.dept_no
left join employees
on dept_managers.emp_no = employees.emp_no;

/*List the department of each employee with the following information: employee number, last name, first name, and department name.*/
select departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
from dept_emp
left join departments
on dept_emp.dept_no = departments.dept_no
left join employees
on dept_emp.emp_no = employees.emp_no
order by departments.dept_name nulls last;

/*List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."*/
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

/*List all employees in the Sales department, including their employee number, last name, first name, and department name.*/
select departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
from dept_emp
left join departments
on dept_emp.dept_no = departments.dept_no
left join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales'

/*List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.*/
select departments.dept_name, employees.last_name, employees.first_name, employees.emp_no
from dept_emp
left join departments
on dept_emp.dept_no = departments.dept_no
left join employees
on dept_emp.emp_no = employees.emp_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development'

/*In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.*/
select last_name, count(last_name) as "last_name_freq_count"
from employees
group by last_name
order by "last_name_freq_count" desc nulls last;



