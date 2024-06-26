
create or replace package body pkg_employee as

procedure p_create_employee
(e_id number,
e_name varchar2,
e_title varchar2,
mgr_id number,
doj date,
sal number,
dept_id number)
as
/* This Procedure will create an employee with the given data */
mgr_check int := 1;
invalid_mgr_id exception;
fk_violation exception;
pragma exception_init(fk_violation, -2291); -- Foreign key violation error code
    
begin
    if mgr_id is not null then
        select count(1) into mgr_check from employees
        where employee_id=mgr_id;
    end if;
    if mgr_Check <> 1 then
        raise invalid_mgr_id;
    end if;

    insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
    values (e_id,e_name, e_title, mgr_id, doj,sal,dept_id);
    commit;

   exception
        when dup_val_on_index then
        dbms_output.put_line('Employee Id already exists!');
        when invalid_mgr_id then
        dbms_output.put_line('Manager is not an employee!');
        when fk_violation then
        dbms_output.put_line('Foreign key constraint violation occurred - Department not available!');
        when others then
        dbms_output.put_line('Error!');
end p_create_employee;    

procedure p_salary_adjustment (emp_id number, act varchar2, percentage number)
as
/* This Procedure will increase or decrease an employee salary with the given percentage */
    invalid_action exception;
    invalid_employee exception;
    cnt int;
begin
    select count(1) into cnt from employees
    where employee_id = emp_id;
    if cnt = 1 then
        if act = 'INCREASE' then
            update employees
            set salary = salary + ((salary * percentage) / 100)
            where employee_id = emp_id;
            commit;
        elsif act = 'DECREASE' then
            update employees
            set salary = salary - ((salary * percentage) / 100)
            where employee_id = emp_id;
            commit;
        else
            raise invalid_action;
        end if;
    else
        raise invalid_employee;
    end if;

    exception
    when invalid_action then
        dbms_output.put_line('Enter valid action! (INCREASE or DECREASE)');
    when invalid_employee then
        dbms_output.put_line('Enter valid employee id!');
    when others then
        dbms_output.put_line('Error!');
end p_salary_adjustment;

procedure p_employee_transfer (emp_id number, to_dept number)
as
/* This Procedure will transfer an employee to different department */
cnt1 int;
cnt2 int;
invalid_employee exception;
invalid_department exception;
begin
    select count(1) into cnt1 from employees where employee_id = emp_id;
    select count(1) into cnt2 from departments where department_id = to_dept;

    if cnt1 <> 1 then
        raise invalid_employee;
    elsif cnt2 <> 1 then
        raise invalid_department;
    else
        update employees
        set department_id = to_dept
        where employee_id = emp_id;
        commit;
    end if;

    exception
    when invalid_employee then
        dbms_output.put_line('Invalid employee id!');
    when invalid_department then
        dbms_output.put_line('Invalid department id!');
    when others then
        dbms_output.put_line('Error!');

end p_employee_transfer;

function f_get_salary(emp_id number)
return number
as
/* This function will return salary of an employee*/
s1 number;
begin
    select salary into s1 from employees
    where employee_id = emp_id;
    return s1;
exception
    when no_data_found then
    return null;
end f_get_salary;

procedure p_display_emp_details(dept_id number)
as
/* This Procedure will display all the employees details for a given department */
begin
    for c in (select EMPLOYEE_ID, EMPLOYEE_NAME, JOB_TITLE, MANAGER_ID, DATE_HIRED, SALARY, DEPARTMENT_ID
              from employees where department_id = dept_id)
    loop
        dbms_output.put_line('Employee id : '|| c.employee_id);
        dbms_output.put_line('Employee name : '|| c.employee_name);
        dbms_output.put_line('Job title : '|| c.job_title);
        dbms_output.put_line('Manager id : '||c.manager_id);
        dbms_output.put_line('Date of joining : '||c.date_hired);
        dbms_output.put_line('Salary : '||c.salary);
        dbms_output.put_line('Department id : '||c.department_id);
    end loop;
exception
    when no_data_found then
        dbms_output.put_line('No data available!');
    when others then
        dbms_output.put_line('Error!');
end p_display_emp_details;

procedure p_total_salary (dept_no number)
as
/* This Procedure will display the total salary of the employees for a given department */
sal number;
dept_name varchar2(50);
begin
    select sum(salary) into sal
    from employees
    where department_id = dept_no;

    select department_name into dept_name
    from departments
    where department_id = dept_no;

    dbms_output.put_line('Total salary for '|| dept_name ||' department is ' || sal);
exception
    when no_data_found then
        dbms_output.put_line('No data available for the department!');
    when others then
        dbms_output.put_line('Error!');
end p_total_salary;

end pkg_employee;
