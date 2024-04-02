--Inserting data into departments table

insert into departments (department_id, department_name, location)
values (1, 'Management', 'London');
insert into departments (department_id, department_name, location)
values (2, 'Engineering', 'Cardiff');
insert into departments (department_id, department_name, location)
values (3, 'Research & Development', 'Edinburgh');
insert into departments (department_id, department_name, location)
values (4, 'Sales', 'Belfast');

commit;

--Inserting data into employees table

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90001,'John Smith', 'CEO', null, to_date('01/01/1995', 'dd/mm/yyyy'),100000,1);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90002,'Jimmy Willis', 'Manager', 90001, to_date('23/09/2003', 'dd/mm/yyyy'),52500,4);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90003,'Roxy Jones', 'Salesperson', 90002, to_date('11/02/2017', 'dd/mm/yyyy'),35000,4);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90004,'Selwyn Field', 'Salesperson', 90003, to_date('20/05/2015', 'dd/mm/yyyy'),32000,4);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90005,'David Hallett', 'Engineer', 90006, to_date('17/04/2018', 'dd/mm/yyyy'),40000,2);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90006,'Sarah Phelps', 'Manager', 90001, to_date('21/03/2015', 'dd/mm/yyyy'),45000,2);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90007,'Louise Harper', 'Engineer', 90006, to_date('01/01/2013', 'dd/mm/yyyy'),47000,2);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90008,'Tina Hart', 'Engineer', 90009, to_date('28/07/2014', 'dd/mm/yyyy'),45000,3);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90009,'Gus Jones', 'Manager', 90001, to_date('15/05/2018', 'dd/mm/yyyy'),50000,3);

insert into employees (employee_id, employee_name, job_title, manager_id, date_hired, salary, department_id)
values (90010,'Mildred Hall', 'Secretary', 90001, to_date('12/10/1996', 'dd/mm/yyyy'),35000,1);

commit;
