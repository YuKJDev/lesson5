begin;
SELECT 
    @E:=s.emp_no
FROM
    salaries s join dept_manager dm using (emp_no) 
    join dept_emp de on dm.dept_no = de.dept_no
WHERE
   dm.dept_no = 'd001'
    AND dm.to_date = '9999-01-01'
    AND (CURDATE() BETWEEN `s`.`from_date` AND `s`.`to_date`)
    group by s.emp_no;
UPDATE dept_emp 
SET 
    dept_no = 'd002'
WHERE
    emp_no = @E;
UPDATE salaries s
SET 
    salary = salary + 1000
WHERE
    emp_no = @E
       AND (CURDATE() BETWEEN `s`.`from_date` AND `s`.`to_date`);
commit; 