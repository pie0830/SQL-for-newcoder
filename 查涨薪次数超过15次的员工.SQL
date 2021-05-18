select emp_no,count(emp_no) as t 
from (select emp_no,salary,
lag(salary,1) over (
    partition by emp_no
    order by emp_no,from_date
) as pre_salary
from salaries)
where salary > pre_salary
group by emp_no having t > 15
;
