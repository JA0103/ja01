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

select first_name || ' ' || last_name as fName
from EMPLOYEES;  -- || �����ڸ� �̿��ؼ� �� ���� ����!


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


/*
 �����Լ� : count, sum, avg, max, min,   --group by having(����)
*/

select count(first_name), count(*)
from employees;

select sum(salary), avg(salary)
from employees;

select max(salary), min(salary)
from EMPLOYEES;

select stddev(salary), variance(salary)
from EMPLOYEES;


/*
grroup by ���� ����
1. ���̺��� where���ǽĿ� �´� ������ ���� ����
2. ������ �� �������� ���� ������ ������ �׷�ȭ
3.������ ������ �׷�ȭ�� ���� ��� ���
*/

select job_id, sum(salary), avg(salary)
from EMPLOYEES
group by job_id;

select job_id, salary
from employees;

select job_id, sum(salary), avg(salary)
from EMPLOYEES
where department_id = 50
group by job_id;

select department_id, max(salary), min(salary)
from EMPLOYEES
group by department_id;

select department_id, max(salary), min(salary)
from EMPLOYEES
where hire_date > '20070101'
group by department_id;

select * from employees where hire_date > '20070101';

select country_id, count(country_id)
from LOCATIONS
group by COUNTRY_ID;

select job_id, department_id, sum(salary), avg(salary)
from EMPLOYEES
group by job_id, department_id;

select job_id, department_id, sum(salary), avg(salary)
from EMPLOYEES
where department_id BETWEEN 50 and 100
group by job_id, department_id;

select job_id, department_id, sum(salary), avg(salary)
from EMPLOYEES
where department_id BETWEEN 50 and 100 
group by job_id, department_id 
order by department_id;


select MANAGER_ID, department_id, sum(salary), avg(salary)
from EMPLOYEES
where department_id = 50
group by MANAGER_ID, department_id
order by MANAGER_ID;

select MANAGER_ID, department_id, max(salary), min(salary)
from EMPLOYEES
where department_id = 50
group by MANAGER_ID, department_id
order by MANAGER_ID;

select department_id, manager_id, job_id, max(salary), min(salary)
from EMPLOYEES
group by department_id, manager_id, job_id
order by manager_id, department_id desc;

select job_id, sum(salary), avg(salary)
from EMPLOYEES
group by job_id
HAVING avg(salary) > 10000;

select department_id, min(salary), max(salary)
from EMPLOYEES
group by DEPARTMENT_ID
HAVING max(salary) > 7000
order by max(salary);

select country_id, count(country_id)
from LOCATIONS
group by country_id
HAVING count(country_id) > 2 ;

select job_id, department_id, sum(salary), avg(salary)
from EMPLOYEES
where department_id BETWEEN 51 and 99
group by job_id, department_id
HAVING avg(salary) > 9000
order by avg(salary);

select manager_id, department_id, job_id, sum(salary), avg(salary) ,max(salary)
from EMPLOYEES
where manager_id in(100,101) 
group by manager_id, department_id, job_id
having sum(salary) BETWEEN 10000 and 40000
order by sum(salary);



--employees ���̺��� salary�� 8000�̻��� ������ ���� ��ȸ
select count(*)
from EMPLOYEES
where salary >8000;

--employees ���̺��� hire_date�� 2007�� 1�� 1�� ������ ������ ���� ��ȸ
select count(*)
from EMPLOYEES
where hire_date > '20070101';

select hire_date
from EMPLOYEES
where hire_date > '20070101';

--jobs ���̺��� max_salary ���� �հ�� ����� ��ȸ
select sum(max_salary), avg( max_salary)
from JOBS;

--employees ���̺��� job_id�� 'IT_PROG'�� ������ salary �հ�� ����� ��ȸ
select job_id, sum(salary), avg(salary)
from EMPLOYEES
where job_id = 'IT_PROG'
group by job_id;

--employees ���̺��� hire_date ���� 2004�� 1�� 1�Ϻ��� 2006��
--12��31�� ������ �����͸� job_id �������� �׷�ȭ�� �ڿ� job_id�� salary �ִ�,�ּҰ� ��ȸ
select job_id, max(salary), min(salary)
from EMPLOYEES
where hire_date BETWEEN '20040101' and '20061231'
group by job_id;

--employees ���̺��� department_id�� 50�� 80�� �����͸�
--department_id�� job_id �������� �׷�ȭ�� �ڿ� department_id��
--job_id, salary �հ�, �ּڰ�, �ִ밪�� job_id �������� �����Ͽ� ��ȸ
select job_id,department_id, sum(salary), max(salary), min(salary)
from employees
where department_id in(50,80)
group by job_id,department_id
order by job_id;

/*
 employees ���̺��� department_id�� job_id �������� �׷�ȭ��
 �ڿ� salary ��հ��� 12000 �̻��� �����͸� department_id��
 job_id, salary �ּڰ�, �ִ밪, ����� department_id �������� ���� ��ȸ
*/
select department_id, job_id, min(salary), max(salary), avg(salary)
from employees
group by department_id, job_id
HAVING avg(salary) >= 12000
order by department_id;



--               nvl() : null ���� Ư���� ������ ġȯ�ض�.
select department_name, nvl( manager_id, 100)
from departments;

select department_name, manager_id
from departments;

select state_province
from locations
order by STATE_PROVINCE;

select nvl(state_province,'NONE')
from locations
order by STATE_PROVINCE;

--        nvl2 :  null ���� �ִ� ���� ���� ��츦 �����Ͽ� Ư�������� ġȯ����
                       --nvl2 : null�� �ƴϸ� ù���� null�̸� �ι�°
select department_name, nvl2(manager_id, '������', '��')
from departments;

--      decode () : �����Ͱ� ���ǰ��� ��ġ�ϸ� ġȯ ���� ����ϰ� ��ġ���� ������ �⺻�� ���
--                         �갡         �̰Ÿ�  �̷���    �ƴϸ� �̰�
select min_salary, decode (min_salary, 2500, min_salary*1.1, min_salary)as decode
from jobs;

select min_salary, 
    case
        when min_salary < 4000 then min_salary*1.2
        when min_salary between 4000 and 6000 then min_salary*1.1
        else min_salary 
    end as �ּұ޿�����
from jobs;


--        rank, dense_rank, row_number

select first_name, salary,
        rank() over(order by salary desc) as rank,  
        dense_rank() over(order by salary desc) as dense_rank,
        row_number() over(order by salary desc) as row_number
from EMPLOYEES;




select * from employees;
select * from departments;



  /*īƼ�� �� : ��� �࿡ ���ؼ� ����*/
select * from employees, departments;

/*�������� : �����ϴ� ���̺��� ���� ������ ��ġ�ϴ� �͸� ��ȸ  >>>  �������� */
select * 
from jobs, JOB_HISTORY
where jobs.JOB_ID = JOB_HISTORY.JOB_ID;

select C.region_id, L.location_id, C.country_id
from countries C, locations L 
where C.country_id = L.country_id;

select * 
from EMPLOYEES e , DEPARTMENTS d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID;

select * from EMPLOYEES;
select * from jobs;

select e.SALARY, j.MIN_SALARY, j.MAX_SALARY
from EMPLOYEES e, jobs j
where e.salary BETWEEN j.min_salary and j.max_salary;

select e.first_name, e.HIRE_DATE, j.START_DATE, j.END_DATE
from employees e, job_history j
where e.hire_date between j.start_date and j.end_date;

select count(*)
from employees
where hire_date between '20070101' and '20071231';

/*
�ܺ����� : �����ϴ� ���̺��� ���� ������ �������� �ʴ� �൵ ���
        �������� ������ �������� ���ϰ� ������ ���� ����� �� ���
*/

select *
from jobs j, JOB_HISTORY h
where j.JOB_ID = h.JOB_ID (+) ;

select *
from jobs j, JOB_HISTORY h
where j.JOB_ID(+) = h.JOB_ID;


select *
from COUNTRIES c, LOCATIONS l
where c.COUNTRY_ID(+) = l.COUNTRY_ID;

select * from EMPLOYEES;


select a.FIRST_NAME, a.LAST_NAME, b.FIRST_NAME, b.LAST_NAME
from EMPLOYEES a, EMPLOYEES b
where a.manager_id = b.EMPLOYEE_ID;
-- -> a��� = b name


/*
countries ���̺�� locations ���̺��� country_id�� ��������
�����Ͽ� country_namae, state_province, street_address�� ��ȸ
*/
select C.COUNTRY_NAME, L.state_province, L.street_address
from COUNTRIES C, LOCATIONS L
where C.COUNTRY_ID = L.COUNTRY_ID;

select * from COUNTRIES;

select * from LOCATIONS;

/*
jobs ���̺�� job_history ���̺��� job_id�� �������� �����Ͽ� 
job_id, job_title, start_date, end_date�� ��ȸ
*/
select j.job_id, j.job_title, h.start_date, h.end_date
from JOBS J , JOB_HISTORY H
where J.JOB_ID = H.JOB_ID;

/*
employees ���̺�� departments ���̺��� department_id
�������� �����ϰ�, employees ���̺�� jobs ���̺��� job_id
�������� �����Ͽ� first_name, last_name, department_name, job_title�� ��ȸ
*/
select e.first_name, e.last_name, d.department_name, j.job_title
from employees E, departments D, jobs J
where E.DEPARTMENT_ID = D.DEPARTMENT_ID and E.JOB_ID = J.JOB_ID;

/*
countries ���̺�� locations ���̺��� locations�� 
country_id�� �������� �ܺ������Ͽ� country_id, country_name,city�� ��ȸ
*/
select C.country_id, C.country_name,L.CITY
from countries C, locations L
where L.COUNTRY_ID(+) = C.COUNTRY_ID;

select *from COUNTRIES;
select *from LOCATIONS;

/*
countries ���̺�� locations ���̺��� locations�� country_id�� ��������
�ܺ� �����Ͽ� country_id, country_name, city�� ��ȸ
*/
select C.COUNTRY_ID, C.COUNTRY_NAME, L.CITY
from COUNTRIES C, LOCATIONS L
where L.COUNTRY_ID(+) = C.COUNTRY_ID;



/*
employees ���̺�� departments ���̺��� 
departments ���̺��� department_id�� �������� �ܺ������Ͽ� 
employee_id, first_name, last_name, department_name�� 
employee_id�� �������� �����Ͽ� ��ȸ
*/
select E.employee_id, E.first_name, E.last_name, D.department_name
from EMPLOYEES E, DEPARTMENTS D
where D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID
order by E.employee_id;

select * from DEPARTMENTS;


/*
employees ���̺��� manager_id�� employee_id�� �������� ��ü���� �� �ڿ�
������ first_name�� last_name�� �����ϰ� �������� first_name�� last_name�� �����Ͽ�
employees_id�� �������� �����Ͽ� ��ȸ
*/
select concat(M.first_name, ' ' || M.last_name)as manager, 
    concat(E.first_name, ' ' ||  E.last_name)as name
from employees E, employees M
where M.employee_id = E.manager_id
order by M.employee_id;


/*
    ���� ���� 
    >> ���� �� ���� ����
    =  <>  !=  >  >=  <  <=   �� ����
*/
select PHONE_NUMBER
from employees
where employee_id =100;

select *
from EMPLOYEES
where PHONE_NUMBER = '515.123.4567';

select *
from EMPLOYEES
where PHONE_NUMBER =(
    select PHONE_NUMBER
    from employees
    where employee_id =100
);

select hire_date
from EMPLOYEES
where email = 'SKING';

select *
from EMPLOYEES
where hire_date = '03/06/17';

select *
from EMPLOYEES
where hire_date < (
    select hire_date
    from EMPLOYEES
    where email = 'SKING'
);

select first_name, SALARY
from EMPLOYEES
where salary < (
    select salary
    from EMPLOYEES
    where employee_id = 100
)
order by SALARY;


-- hire_date 06/01/03 --> salary
select *
from EMPLOYEES
where salary = (
    select SALARY
    from employees
    where hire_date = '06/01/03'
);

/*  ���� ��������  */

select max(salary)
from employees
group by department_id;

select *from EMPLOYEES;

select employee_id,  max(salary)
from employees
group by department_id , EMPLOYEE_ID;

select * from EMPLOYEES 
where salary in (
    select max(salary)
    from employees
    group by department_id
);

select * from EMPLOYEES 
where salary not in (
    select max(salary)
    from employees
    group by department_id
)
order by SALARY;


/* EXISTS () ��ȣ ���� Ʈ���̸�    */
select*
from EMPLOYEES
where EXISTS (
    select *
    from EMPLOYEES
    where employee_id=100
);

--any/some () : () �� �ϳ��� ������Ű�� true
select *
from EMPLOYEES
where salary <> any(6000,10000,12000);

select *
from EMPLOYEES
where salary > any(
    select salary
    from EMPLOYEES
    where hire_date > '08/01/01'
);

--all() : ()���� �� �������Ѿ� ��
--exists() : ()�ȿ� ���� �ϳ��� �����ϸ� true >> Ư�� �������� ��� ���� ���� ������ ���� 
                                          -- ���� ������ ������ ���� ���θ� �����ؾ� �� �� ���


/*
departments ���̺��� department_name�� 'IT'��
department_id�� ��ġ�ϴ� employees���̺��� 
first_name, last_name, job_id, salary�� ��ȸ
*/
select first_name, last_name, job_id, salary, DEPARTMENT_ID
from EMPLOYEES
where department_id = (select department_id
                        from DEPARTMENTS
                        where department_name = 'IT'
                        );


/*
locations ���̺��� state_province�� 'California'��
location_id�� ��ġ�ϴ� departments ���̺��� 
department_id, department_name�� ��ȸ
*/
select department_id, department_name, LOCATION_ID
from DEPARTMENTS
where LOCATION_ID = (select location_id
                    from LOCATIONS
                    where state_province = 'California'
                    );

/*
countries ���̺��� region_id �� 3�� country_id�� ���Ե�
locations ���̺��� city, state_province, street_address�� ��ȸ
*/
select city, state_province, street_address , COUNTRY_ID
from locations
where COUNTRY_ID in (select country_id
                    from COUNTRIES
                    where region_id = 3);

/*
departments ���̺��� manager_id�� null�� �ƴ�
department_id�� ��ġ�ϴ� employees ���̺��� 
first_name, last_name, job_id, salary�� ��ȸ
*/
select FIRST_NAME, LAST_NAME, JOB_ID, SALARY
from EMPLOYEES
where DEPARTMENT_ID in (select department_id
                        from DEPARTMENTS
                        where manager_id is not null);
-- selet() �ȿ� �����Ͱ� �ϳ��� = �̰ɷ� ���� �� ������ �������� in ���� ã�ƾ� �Ѵ�.

/*
    locations ���̺��� city�� 'Seattle'�� �������� �ʴ�
    location_id�� ��ġ�ϴ� departments ���̺��� 
    department_id, department_name�� ��ȸ
*/
select department_id, department_name, location_id
from DEPARTMENTS
where LOCATION_ID in ( select location_id
                    from LOCATIONS
                    where city not in 'Seattle');

select city
from LOCATIONS;

/*
regions ���̺��� region_name �� 'Europe'�� region_id��
��ġ�ϴ� countries ���̺��� country_id�� ���Ե� locations ���̺���
city, state_province, street_address�� ��ȸ
*/
select city, state_province, street_address
from LOCATIONS
where COUNTRY_ID in ( select COUNTRIES.COUNTRY_ID
                        from COUNTRIES
                        where region_id = (select region_id
                                            from REGIONS
                                            where region_name = 'Europe'));

/*
DML(data manipulation language)
select
insert
update
delete
CRUD ( creat(����) read(�б�) update(����) delete(����) )
*/

select * from COUNTRIES;

insert into COUNTRIES
values ('KR', 'North Korea', '3');

insert into COUNTRIES (country_id, country_name, region_id)
values('KP', 'South Korea' , 3);

insert into COUNTRIES (country_id, country_name)
values('KM', 'South Korea' );

commit;

update COUNTRIES
set COUNTRY_NAME =  'South Korea'
where COUNTRY_ID = 'KR';

update COUNTRIES
set COUNTRY_NAME = 'North korea'
where COUNTRY_ID = 'KP';

select * from COUNTRIES;

select * 
from jobs
where  job_id = 'IT_PROG';

update jobs
set min_salary = 10000, MAX_SALARY = 20000
where job_id = 'IT_PROG';

delete 
from COUNTRIES
where COUNTRY_ID = 'KM';

/*
countries ���̺�
country_id country_name region_id
AT Austria 1
NO Norway 1
ID Indonesia 3
TR Turkey 4
*/

select * from COUNTRIES;

insert into COUNTRIES (country_id, country_name, region_id)
values('AT', 'Austria', 1);

insert into COUNTRIES (country_id, country_name, region_id)
values('NO', 'Norway', 1);

insert into COUNTRIES (country_id, country_name, region_id)
values('ID', 'Indonesia', 3);

insert into COUNTRIES (country_id, country_name, region_id)
values('TR', 'Turkey', 4);

/*
countries ���̺�
country_id country_name region_id
AT Austria 1+10
NO Norway 1+10
ID Indonesia 3+10
TR Turkey 4+10
*/
update COUNTRIES
set REGION_ID = region_id + 10
where COUNTRY_ID in ('AT','NO','ID','TR') ;

select* from COUNTRIES;

--  >>  220526 SCOTT.sql 