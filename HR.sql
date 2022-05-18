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
 ���� ������ ( union(������ �ߺ�x), union all(������ �ߺ�o), minus(������), intersect(������) ) 
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


/*
���� ������ : union, union all, minus, intersect
*/

select employee_id, first_name, department_id
from employees
where department_id = 60
union
select employee_id, first_name, department_id
from employees
where department_id = 100;


select employee_id, first_name, department_id
from employees
where department_id <= 160
union
select employee_id, first_name, department_id
from employees
where department_id >=140;


select employee_id, first_name, department_id
from employees
where department_id <= 100
minus
select employee_id, first_name, department_id
from employees
where department_id >=50;

select employee_id, first_name, department_id
from employees
where department_id <= 100
intersect
select employee_id, first_name, department_id
from employees
where department_id >=50;


--jobs ���̺��� job_title �������� �����Ͽ� ���� ��ȸ //(asc ��������)
select *
from JOBS
order by job_title;

--countries ���̺��� country_name ���� ������������ �����Ͽ� ��ȸ
SELECT *
from COUNTRIES
order by COUNTRY_NAME desc;

--employees  ���̺���  salary�� 10000���� 12000 ������ ���� ��ȸ
select *
from EMPLOYEES
where SALARY >=10000 and SALARY<12000;

select *
from EMPLOYEES
where SALARY between 10000 and 12000;

--employees ���̺��� job_id�� 'IT_PROG'�� 'ST_MAN'�� ���� ��ȸ
select *
from EMPLOYEES
where job_id = 'IT_PROG' or job_id = 'ST_MAN';

select *
from EMPLOYEES
where job_id in('IT_PROG' , 'ST_MAN');

--employees ���̺��� manager_id�� NULL�� ���� ��ȸ
select *
from EMPLOYEES
where manager_id is null;

--departments ���̺��� manager_id�� Null�� �ƴ� �μ� ��ȸ
select *
from departments
where manager_id is not null;

--employees ���̺���  job_id�� 'AD'�� �����ϴ� ���� ��ȸ
select *
from employees
where job_id like 'AD%';

--employees ���̺��� first_name���� 'ni'�� �����ϴ� ���� ��ȸ
select *
from employees
where first_name like '%ni%';




/*
 ������  
 ��� ������ ( + - * / )
 �� ������ ( = <> != > >= < <= ) 
 �� ������ ( and, or, not )
 ���� ������ ( union(������ �ߺ�x), union all(������ �ߺ�o), minus(������), intersect(������) )
 SQL ������ ( between in , like , is null )

 ���� �Ӹ� �ƴϰ� ���ڳ� ��¥ ���� ���ϴ� �͵� ����
  ��) 'A' < 'C'
     '2020-10-10' < '2022-0517'


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


 --�Լ�

select first_name, lower(first_name),
upper(first_name), initcap(first_name)
from EMPLOYEES;

select job_id, substr(job_id,1,2)  , substr(job_id, 4) 
from EMPLOYEES;

select job_id, replace (job_id, 'MGR','MANAGER')
from employees;

select job_id, replace(job_id, 'PROG','PROGRAMMER')
from EMPLOYEES;

select first_name, last_name, concat(first_name, concat(' ', last_name)) as fName
from EMPLOYEES;  --concat : ���ڿ� �� �� ����


select first_name, LENGTH(first_name)  --length : ����
from EMPLOYEES;

select first_name, instr(first_name, 'a')  --instr : ���ڿ� ��ġ�� ��ȯ
from EMPLOYEES;

select lpad(first_name, 10, '*'), rpad(first_name, 10, '*')
from EMPLOYEES;

select job_id, ltrim(job_id, 'A') , rtrim(job_id, 'T')
from EMPLOYEES;  -- Ltrim : ���ʿ��� Ư�� ���ڿ��� ����

select length (trim(' �浿   ')), length (trim(' ��� �� �� �� '))
from dual;  --dual : ���̺� �ֱ� �ؾ��ϴµ� Ư���� ���� �ʿ� ������



--jobs ���̺��� job_title�� �ҹ��ڿ� �빮�ڷ� ��ȯ�� job_title�� ��ȸ
select job_title, 
lower(job_title), upper(job_title),
initcap(job_title) --ù���ڸ� �빮��
from JOBS;

--employeees ���̺��� first_name ù ���ڿ� last_name ��ȸ
select substr(first_name,1,1) as name1st, last_name
from EMPLOYEES;

--employees ���̺��� job_id �� 'REP'�� �κ��� 'REPRESENTATIVE'�� �ٲ㼭 ��ȸ
select job_id, 
replace (job_id, 'REP','REPRESENTATIVE')
from EMPLOYEES;

--employees ���̺��� first_name ù ���ڿ� last_name�� �߰��� ������ �ΰ� �ϳ��� �����Ͽ� ��ȸ
select concat(substr(first_name,1,1), concat(' ', last_name))
from employees;

--employees ���̺��� first_name�� last_name�� ���̸� ���ļ� ��ȸ
select length (concat (first_name,  last_name))
from employees;

--employees ���̺��� job_id�� job_id�� 'A' ���� ��ġ ��ȸ
select job_id ,instr( job_id ,'A')
from employees;

--locations ���̺��� city�� 15�ڸ� ���ڿ��� �ٲٰ�, �� ������ '.'���� ǥ���Ͽ� ��ȸ
select lpad(city,15,'.') as city
from locations;

--locations ���̺��� city�� ���ʺ��� 'S' ���ڸ� ���� �Ͱ� �����ʺ��� 'e' ���ڸ� ���� ����� ��ȸ
select ltrim(city,'S'), rtrim(city,'e')
from locations;



--     �����ø�        ��������         �ݿø�             ����             ������        �ŵ�����    ������
select ceil(12.345), floor(12.345), round(1242.345, -3), trunc(12.345,2), mod(12,5), power(3,3), sqrt(9)
,sign(10), sign(0), sign(-5)
--���:1    0:0      ����:-1   
from dual;

--sysdate: ���� ��¥
select sysdate, sysdate+1, sysdate+100
from dual;

                           --���ÿ��� �Ի��ϱ����� ���� ��
select sysdate, MONTHS_BETWEEN(sysdate, hire_date) 
from EMPLOYEES
where employee_id = 100;
                
select hire_date, add_months(hire_date, 2), add_months(hire_date, -2)
from EMPLOYEES;

/*
 to_char : ���ڳ� ��¥�� ���ڵ����ͷ� ��ȯ
 to_number : ���ڸ� ���ڷ� ����
 to_date : ���� �����͸� ��¥ �����ͷ� ����
*/
                   --  ���� ���� �б�
select to_char(sysdate, 'CC AD Q')
from dual;
                           
select to_char(sysdate, 'yyyy-mon-mm-dd-day-d-ddd')  
from dual;

select sysdate
from dual;

select salary, to_char(salary, '$0999999')
from EMPLOYEES;
--0 �� ������ ä�� / 9�� ������ ä��� ������ ���ƶ�
select salary, to_char(salary, '9,999,999')
from EMPLOYEES;




