create or replace package pkg_employee as

procedure p_create_employee (e_id number, e_name varchar2, e_title varchar2, mgr_id number, doj date, sal number, dept_id number);
procedure p_salary_adjustment (emp_id number, act varchar2, percentage number);
procedure p_employee_transfer (emp_id number, to_dept number);
function f_get_salary(emp_id number) return number;
procedure p_display_emp_details(dept_id number);
procedure p_total_salary (dept_no number);

end pkg_employee;
