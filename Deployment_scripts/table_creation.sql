--Creating departments table
create table departments
(
    department_id number(5,0) not null ,
    department_name varchar2(50) not null ,
    location varchar2(50) not null ,
    constraint pk_departments primary key (department_id)
);

--column comments
comment on column departments.department_id
is 'The unique identifier for the department';

comment on column departments.department_name
is 'The name of the department';

comment on column departments.location
is 'The physical location of the department';

--creating employees table
create table employees
(
    employee_id number(10,0) not null,
    employee_name varchar2(50) not null,
    job_title varchar2(50) not null,
    manager_id number(10,0),
    Date_hired date not null,
    salary number(10,0) not null,
    department_id number(5,0) not null,
    constraint pk_employees primary key (employee_id),
    constraint fk_department_id foreign key(department_id) references departments(department_id)
);

--column comments
comment on column employees.employee_id 
is 'The unique identifier for the employee';

comment on column employees.employee_name
is 'The name of the employee';

comment on column employees.job_title
is 'The job role undertaken by the employee. Some employees may undertaken the same job role';

comment on column employees.manager_id
is 'manager of the employee';

comment on column employees.date_hired 
is 'The date the employee was hired';

comment on column employees.salary
is 'Current salary of the employee';

comment on column employees.department_id
is 'Each employee must belong to a department';