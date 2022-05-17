select first_name, last_name, salary from EMPLOYEES;
select first_name, last_name, salary+10000 from EMPLOYEES;

select first_name, last_name, salary-10000 from EMPLOYEES;

select first_name, last_name, salary*1.1 from EMPLOYEES;


select * from tab;

select department_id as id, department_name as name from departments;


-- ||  �÷��̳� ���ڿ��� ����
select department_id || department_name name from departments;
select 'department_id ' || department_name name from departments;

--countries ���̺��� �÷��� country_id�� ����ID, country_name�� ���������� ��ȸ
select country_id as ����ID , country_name as ������ from COUNTRIES;

-- countries ���̺��� region_id�� �ߺ������ϰ� ��ȸ
select DISTINCT region_id from COUNTRIES;

--jobs ���̺��� job_title, min_salary, max_salary �÷���
--�ּҿ����� �ִ뿬���� 10% �λ�� ���·� ��ȸ
select job_title , min_salary*1.1 as �ּҿ��� , max_salary*1.1 as �ִ뿬��
from jobs;



/*
 ������  
 ��� ������ ( + - * / )
 �� ������ ( = <> != > >= < <= ) 
 �� ������ ( and, or, not )
 ���� ������ ( union, union all(������), minus(������), intersect )
 SQL ������ ( between in , like , is null )

 ���� �Ӹ� �ƴϰ� ���ڳ� ��¥ ���� ���ϴ� �͵� ����
  ��) 'A' < 'C'
     '2020-10-10' < '2022-0517'
*/

select * 
from EMPLOYEES
where EMPLOYEE_ID = 100;

select *
from EMPLOYEES
where EMPLOYEE_ID <> 110;

select *
from EMPLOYEES
where EMPLOYEE_ID != 110;

select * 
from EMPLOYEES
where EMPLOYEE_ID < 110;

SELECT * 
FROM EMPLOYEES
where EMPLOYEE_ID >=120 and EMPLOYEE_ID <= 130;

select * 
from EMPLOYEES
where manager_id = 100 or MANAGER_ID = 120;

select *
from EMPLOYEES
where LAST_NAME = 'Weiss' or LAST_NAME = 'Russell';

select count(*)
from EMPLOYEES
where not DEPARTMENT_ID = 50;
--�� �����
select count(*) from EMPLOYEES;

select *
from EMPLOYEES
where not EMPLOYEE_ID = 100 and not EMPLOYEE_ID = 130;


-- employees ���̺��� first_name �� 'David'�� ���� ��ȸ
select *
from EMPLOYEES
where first_name = 'David';

--jobs ���̺��� �ּ� ������ 8000 �ʰ��� ���� ��ȸ
select job_title
from jobs
where MIN_SALARY > 8000;

--jobs ���̺��� �ּ� ������ 4000 �̻��̰� �ִ� ������ 10000 ������ ���� ��ȸ
select job_title
from jobs
where MIN_SALARY >= 4000 and MAX_SALARY <= 10000;

--employees ���̺��� job_id�� 'IT_PROG'�̸鼭 salary�� 5000 �ʰ��� ������ȸ
select *
from employees
where job_id = 'IT_PROG' and salary >5000;

--between -->> �� ���� ������ �ش��ϴ� �����͸� ����� �� ���Ǵ� Ȯ�� ������
select *
from EMPLOYEES
where EMPLOYEE_ID BETWEEN 120 and 130;
-- ==> where EMPLOYEE_ID >= 120 and EMPLOYEE_ID <= 130;

--in������ 
select *
from EMPLOYEES
where FIRST_NAME in('Steven', 'John');

select *
from COUNTRIES
where COUNTRY_ID in('US', 'IL', 'SG');

select *
from COUNTRIES
where COUNTRY_ID not in('US', 'IL', 'SG');

select *
from EMPLOYEES
where COMMISSION_PCT is null;

select *
from EMPLOYEES
where COMMISSION_PCT is not null;

/*
 Like ������ >> ���ڿ� �Ӽ����� �κ������� ��ġ�ϴ� �����͸� ��� �� �� ���
 % --> 0�� �̻��� ���� ( ������ ����� ������ ��� ���� )
 _ --> 1���� ����

 Like 'data%'     -->  data�� �����ϴ� ���ڿ�
 Like '%data'     -->  data�� ������ ���ڿ�
 Like '%data%'    -->  data�� ���Ե� ���ڿ�
 Like 'data____'  -->  data�� �����ϴ� 8�� ���ڿ�
      (4�� + 4��)
 Like '____data'  -->  data�� ������ 8�� ���ڿ�
*/

select *
from LOCATIONS
where city like 'South%';

select *
from LOCATIONS
where STREET_ADDRESS like '%St';

select *
from LOCATIONS
where city like 'South____';

select * from LOCATIONS;

select *
from LOCATIONS
where city like '%San%';

select *
from JOB_HISTORY
where START_DATE > '01/01/13';

























