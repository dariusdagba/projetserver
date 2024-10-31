CREATE TABLE EMP(empno number(20),ename VARCHAR(50),hiredate date, salaire decimal(10,2), deptno number(20), primary key(empno));
CREATE TABLE DEPT(deptno number(20),dname VARCHAR(50),loc VARCHAR(50),primary key(deptno));

alter table emp add constraint fk_emp_dept foreign key(deptno) references dept(deptno);

insert into dept values(10,'Informatique','MONTREAL');
insert into dept values(20,'Comptabilité','MONTREAL');

insert into emp values(01,'SMITH',to_date('01-01-2021','DD-MM-YYYY'),2500,10);
insert into emp values(02,'MATHIEU',to_date('10-09-2020','DD-MM-YYYY'),3200,10);
insert into emp values(03,'SCOTT',to_date('01-10-2021','DD-MM-YYYY'),3000,20);
insert into emp values(04,'YASSINE',to_date('12-10-2021','DD-MM-YYYY'),2000,20);
insert into emp values(05,'CEDRIC',to_date('08-10-2021','DD-MM-YYYY'),2500,10);

SET SERVEROUTPUT ON
DECLARE
cursor c_empt is
select empno,ename,hiredate from emp where ename='SCOTT';
v_empno emp.empno%type;
v_ename emp.ename%type;
v_hiredate emp.hiredate%type;
begin
open c_empt;
fetch c_empt into v_empno,v_ename,v_hiredate;
DBMS_OUTPUT.PUT_LINE(v_empno||' '|| v_ename||' '||v_hiredate);
close c_empt;
end;

SET SERVEROUTPUT ON
DECLARE
cursor c_empt is
select ename,salaire,dname from emp join dept on emp.deptno=dept.deptno where ename='SMITH';
v_salaire emp.salaire%type;
v_ename emp.ename%type;
v_dname dept.dname%type;
begin
open c_empt;
fetch c_empt into v_ename,v_salaire,v_dname;
DBMS_OUTPUT.PUT_LINE(v_ename||' '|| v_salaire||' '||v_dname);
close c_empt;
end;

SET SERVEROUTPUT ON
DECLARE
cursor c_empt is
select * from dept;
v_empt c_empt%rowtype;
begin
open c_empt;
fetch c_empt into v_empt;
while c_empt%found loop
DBMS_OUTPUT.PUT_LINE(v_empt.deptno||' '||v_empt.dname||' '||v_empt.loc);
fetch c_empt into v_empt;
end loop;
close c_empt;
end;

SET SERVEROUTPUT ON
DECLARE
cursor c_empt is
select ename,salaire from emp;
v_empt c_empt%rowtype;
begin
open c_empt;
loop
fetch c_empt into v_empt;
exit when c_empt%notfound;
DBMS_OUTPUT.PUT_LINE(v_empt.ename||' '||v_empt.salaire);
end loop;
close c_empt;
end;

SET SERVEROUTPUT ON
DECLARE
cursor c_empt is
select ename,salaire from emp;
begin
for v_empt in c_empt loop
DBMS_OUTPUT.PUT_LINE(v_empt.ename||' '||v_empt.salaire);
end loop;
end;





