select first_name, last_name, salary from EMPLOYEES;
select first_name, last_name, salary+10000 from EMPLOYEES;

select first_name, last_name, salary-10000 from EMPLOYEES;

select first_name, last_name, salary*1.1 from EMPLOYEES;


select * from tab;

select department_id as id, department_name as name from departments;


-- ||  컬럼이나 문자열을 연결
select department_id || department_name name from departments;
select 'department_id ' || department_name name from departments;

--countries 테이블에서 컬럼명 country_id를 국가ID, country_name를 국가명으로 조회
select country_id as 국가ID , country_name as 국가명 from COUNTRIES;

-- countries 테이블에서 region_id를 중복제외하고 조회
select DISTINCT region_id from COUNTRIES;

--jobs 테이블에서 job_title, min_salary, max_salary 컬럼을
--최소연봉과 최대연봉을 10% 인상된 상태로 조회
select job_title , min_salary*1.1 as 최소연봉 , max_salary*1.1 as 최대연봉
from jobs;



/*
 연산자  
 산술 연산자 ( + - * / )
 비교 연산자 ( = <> != > >= < <= ) 
 논리 연산자 ( and, or, not )
 집합 연산자 ( union(합집합 중복x), union all(합집합 중복o), minus(차집합), intersect(교집합) ) 
 SQL 연산자 ( between in , like , is null )

 숫자 뿐만 아니고 문자나 날짜 값을 비교하는 것도 가능
  예) 'A' < 'C'
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
--총 몇개인지
select count(*) from EMPLOYEES;

select *
from EMPLOYEES
where not EMPLOYEE_ID = 100 and not EMPLOYEE_ID = 130;


-- employees 테이블에서 first_name 이 'David'인 직원 조회
select *
from EMPLOYEES
where first_name = 'David';

--jobs 테이블에서 최소 월급이 8000 초과인 직업 조회
select job_title
from jobs
where MIN_SALARY > 8000;

--jobs 테이블에서 최소 월급이 4000 이상이고 최대 월급이 10000 이하인 직업 조회
select job_title
from jobs
where MIN_SALARY >= 4000 and MAX_SALARY <= 10000;

--employees 테이블에서 job_id가 'IT_PROG'이면서 salary가 5000 초과인 직원조회
select *
from employees
where job_id = 'IT_PROG' and salary >5000;

--between -->> 두 값의 범위에 해당하는 데이터만 출력할 때 사용되는 확장 연산자
select *
from EMPLOYEES
where EMPLOYEE_ID BETWEEN 120 and 130;
-- ==> where EMPLOYEE_ID >= 120 and EMPLOYEE_ID <= 130;

--in연산자 
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
 Like 연산자 >> 문자열 속성에서 부분적으로 일치하는 데이터만 출력 할 때 사용
 % --> 0개 이상의 문자 ( 문자의 내용과 갯수는 상관 없음 )
 _ --> 1개의 문자

 Like 'data%'     -->  data로 시작하는 문자열
 Like '%data'     -->  data로 끝나는 문자열
 Like '%data%'    -->  data가 포함된 문자열
 Like 'data____'  -->  data로 시작하는 8개 문자열
      (4개 + 4개)
 Like '____data'  -->  data로 끝나는 8개 문자열
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
집합 연산자 : union, union all, minus, intersect
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


--jobs 테이블에서 job_title 기준으로 정렬하여 직업 조회 //(asc 생략가능)
select *
from JOBS
order by job_title;

--countries 테이블에서 country_name 기준 내림차순으로 정렬하여 조회
SELECT *
from COUNTRIES
order by COUNTRY_NAME desc;

--employees  테이블에서  salary가 10000에서 12000 사이인 직원 조회
select *
from EMPLOYEES
where SALARY >=10000 and SALARY<12000;

select *
from EMPLOYEES
where SALARY between 10000 and 12000;

--employees 테이블에서 job_id가 'IT_PROG'와 'ST_MAN'인 직원 조회
select *
from EMPLOYEES
where job_id = 'IT_PROG' or job_id = 'ST_MAN';

select *
from EMPLOYEES
where job_id in('IT_PROG' , 'ST_MAN');

--employees 테이블에서 manager_id가 NULL인 직원 조회
select *
from EMPLOYEES
where manager_id is null;

--departments 테이블에서 manager_id가 Null이 아닌 부서 조회
select *
from departments
where manager_id is not null;

--employees 테이블에서  job_id가 'AD'로 시작하는 직원 조회
select *
from employees
where job_id like 'AD%';

--employees 테이블의 first_name에서 'ni'를 포함하는 직원 조회
select *
from employees
where first_name like '%ni%';




/*
 연산자  
 산술 연산자 ( + - * / )
 비교 연산자 ( = <> != > >= < <= ) 
 논리 연산자 ( and, or, not )
 집합 연산자 ( union(합집합 중복x), union all(합집합 중복o), minus(차집합), intersect(교집합) )
 SQL 연산자 ( between in , like , is null )

 숫자 뿐만 아니고 문자나 날짜 값을 비교하는 것도 가능
  예) 'A' < 'C'
     '2020-10-10' < '2022-0517'


 Like 연산자 >> 문자열 속성에서 부분적으로 일치하는 데이터만 출력 할 때 사용
 % --> 0개 이상의 문자 ( 문자의 내용과 갯수는 상관 없음 )
 _ --> 1개의 문자

 Like 'data%'     -->  data로 시작하는 문자열
 Like '%data'     -->  data로 끝나는 문자열
 Like '%data%'    -->  data가 포함된 문자열
 Like 'data____'  -->  data로 시작하는 8개 문자열
      (4개 + 4개)
 Like '____data'  -->  data로 끝나는 8개 문자열
*/


 --함수

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
from EMPLOYEES;  --concat : 문자열 두 개 결합

select first_name || ' ' || last_name as fName
from EMPLOYEES;  -- || 연산자를 이용해서 할 수도 있음!


select first_name, LENGTH(first_name)  --length : 길이
from EMPLOYEES;

select first_name, instr(first_name, 'a')  --instr : 문자열 위치값 반환
from EMPLOYEES;

select lpad(first_name, 10, '*'), rpad(first_name, 10, '*')
from EMPLOYEES;

select job_id, ltrim(job_id, 'A') , rtrim(job_id, 'T')
from EMPLOYEES;  -- Ltrim : 왼쪽에서 특정 문자열을 제거

select length (trim(' 길동   ')), length (trim(' 어사 박 문 수 '))
from dual;  --dual : 테이블 있긴 해야하는데 특별히 만들 필요 없을때



--jobs 테이블에서 job_title과 소문자와 대문자로 변환한 job_title을 조회
select job_title, 
lower(job_title), upper(job_title),
initcap(job_title) --첫글자만 대문자
from JOBS;

--employeees 테이블에서 first_name 첫 문자와 last_name 조회
select substr(first_name,1,1) as name1st, last_name
from EMPLOYEES;

--employees 테이블에서 job_id 가 'REP'인 부분을 'REPRESENTATIVE'로 바꿔서 조회
select job_id, 
replace (job_id, 'REP','REPRESENTATIVE')
from EMPLOYEES;

--employees 테이블에서 first_name 첫 문자와 last_name을 중간에 공백을 두고 하나로 결합하여 조회
select concat(substr(first_name,1,1), concat(' ', last_name))
from employees;

--employees 테이블에서 first_name과 last_name의 길이를 합쳐서 조회
select length (concat (first_name,  last_name))
from employees;

--employees 테이블에서 job_id와 job_id에 'A' 문자 위치 조회
select job_id ,instr( job_id ,'A')
from employees;

--locations 테이블의 city를 15자리 문자열로 바꾸고, 빈 공간을 '.'으로 표현하여 조회
select lpad(city,15,'.') as city
from locations;

--locations 테이블에서 city의 왼쪽부터 'S' 문자를 지운 것과 오른쪽부터 'e' 문자를 지운 결과를 조회
select ltrim(city,'S'), rtrim(city,'e')
from locations;



--     정수올림        정수내림         반올림             절삭             나머지        거듭제곱    제곱근
select ceil(12.345), floor(12.345), round(1242.345, -3), trunc(12.345,2), mod(12,5), power(3,3), sqrt(9)
,sign(10), sign(0), sign(-5)
--양수:1    0:0      음수:-1   
from dual;

--sysdate: 오늘 날짜
select sysdate, sysdate+1, sysdate+100
from dual;

                           --오늘에서 입사일까지의 개월 수
select sysdate, MONTHS_BETWEEN(sysdate, hire_date) 
from EMPLOYEES
where employee_id = 100;
                
select hire_date, add_months(hire_date, 2), add_months(hire_date, -2)
from EMPLOYEES;

/*
 to_char : 숫자나 날짜를 문자데이터로 변환
 to_number : 문자를 숫자로 변경
 to_date : 문자 데이터를 날짜 데이터로 변경
*/
                   --  세기 서기 분기
select to_char(sysdate, 'CC AD Q')
from dual;
                           
select to_char(sysdate, 'yyyy-mon-mm-dd-day-d-ddd')  
from dual;

select sysdate
from dual;

select salary, to_char(salary, '$0999999')
from EMPLOYEES;
--0 은 무조건 채움 / 9는 있으면 채우고 없으면 말아라
select salary, to_char(salary, '9,999,999')
from EMPLOYEES;


/*
 집계함수 : count, sum, avg, max, min,   --group by having(조건)
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
grroup by 동작 순서
1. 테이블에서 where조건식에 맞는 데이터 값만 구분
2. 지정한 열 기준으로 같은 데이터 값으로 그룹화
3.지정한 열들의 그룹화된 집계 결과 출력
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



--employees 테이블에서 salary가 8000이상인 직원의 수를 조회
select count(*)
from EMPLOYEES
where salary >8000;

--employees 테이블에서 hire_date가 2007년 1월 1일 이후인 직원의 수를 조회
select count(*)
from EMPLOYEES
where hire_date > '20070101';

select hire_date
from EMPLOYEES
where hire_date > '20070101';

--jobs 테이블에서 max_salary 값의 합계와 평균을 조회
select sum(max_salary), avg( max_salary)
from JOBS;

--employees 테이블에서 job_id가 'IT_PROG'인 직원의 salary 합계와 평균을 조회
select job_id, sum(salary), avg(salary)
from EMPLOYEES
where job_id = 'IT_PROG'
group by job_id;

--employees 테이블에서 hire_date 값이 2004년 1월 1일부터 2006년
--12월31일 사이의 데이터를 job_id 기준으로 그룹화한 뒤에 job_id와 salary 최대,최소값 조회
select job_id, max(salary), min(salary)
from EMPLOYEES
where hire_date BETWEEN '20040101' and '20061231'
group by job_id;

--employees 테이블에서 department_id가 50과 80인 데이터를
--department_id와 job_id 기준으로 그룹화한 뒤에 department_id와
--job_id, salary 합계, 최솟값, 최대값을 job_id 기준으로 정렬하여 조회
select job_id,department_id, sum(salary), max(salary), min(salary)
from employees
where department_id in(50,80)
group by job_id,department_id
order by job_id;

/*
 employees 테이블에서 department_id와 job_id 기준으로 그룹화한
 뒤에 salary 평균값이 12000 이상인 데이터만 department_id와
 job_id, salary 최솟값, 최대값, 평균을 department_id 기준으로 정렬 조회
*/
select department_id, job_id, min(salary), max(salary), avg(salary)
from employees
group by department_id, job_id
HAVING avg(salary) >= 12000
order by department_id;



--               nvl() : null 값을 특정한 값으로 치환해라.
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

--        nvl2 :  null 값이 있는 경우와 없는 경우를 구분하여 특정값으로 치환가능
                       --nvl2 : null이 아니면 첫번때 null이면 두번째
select department_name, nvl2(manager_id, '관리자', '무')
from departments;

--      decode () : 데이터가 조건값과 일치하면 치환 값을 출력하고 일치하지 않으면 기본값 출력
--                         얘가         이거면  이렇게    아니면 이거
select min_salary, decode (min_salary, 2500, min_salary*1.1, min_salary)as decode
from jobs;

select min_salary, 
    case
        when min_salary < 4000 then min_salary*1.2
        when min_salary between 4000 and 6000 then min_salary*1.1
        else min_salary 
    end as 최소급여변경
from jobs;


--        rank, dense_rank, row_number

select first_name, salary,
        rank() over(order by salary desc) as rank,  
        dense_rank() over(order by salary desc) as dense_rank,
        row_number() over(order by salary desc) as row_number
from EMPLOYEES;




select * from employees;
select * from departments;



  /*카티션 곱 : 모든 행에 대해서 조인*/
select * from employees, departments;

/*동등조인 : 조인하는 테이블에서 조인 조건이 일치하는 것만 조회  >>>  내부조인 */
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
외부조인 : 조인하는 테이블엥서 조인 조건을 만족하지 않는 행도 출력
        동등조인 조건을 만족하지 못하고 누락된 행을 출력할 때 사용
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
-- -> a상관 = b name


/*
countries 테이블과 locations 테이블을 country_id를 기준으로
조인하여 country_namae, state_province, street_address를 조회
*/
select C.COUNTRY_NAME, L.state_province, L.street_address
from COUNTRIES C, LOCATIONS L
where C.COUNTRY_ID = L.COUNTRY_ID;

select * from COUNTRIES;

select * from LOCATIONS;

/*
jobs 테이블과 job_history 테이블을 job_id를 기준으로 조인하여 
job_id, job_title, start_date, end_date를 조회
*/
select j.job_id, j.job_title, h.start_date, h.end_date
from JOBS J , JOB_HISTORY H
where J.JOB_ID = H.JOB_ID;

/*
employees 테이블과 departments 테이블을 department_id
기준으로 조인하고, employees 테이블과 jobs 테이블을 job_id
기준으로 조인하여 first_name, last_name, department_name, job_title을 조회
*/
select e.first_name, e.last_name, d.department_name, j.job_title
from employees E, departments D, jobs J
where E.DEPARTMENT_ID = D.DEPARTMENT_ID and E.JOB_ID = J.JOB_ID;

/*
countries 테이블과 locations 테이블을 locations의 
country_id를 기준으로 외부조인하여 country_id, country_name,city를 조회
*/
select C.country_id, C.country_name,L.CITY
from countries C, locations L
where L.COUNTRY_ID(+) = C.COUNTRY_ID;

select *from COUNTRIES;
select *from LOCATIONS;

/*
countries 테이블과 locations 테이블을 locations의 country_id를 기준으로
외부 조인하여 country_id, country_name, city를 조회
*/
select C.COUNTRY_ID, C.COUNTRY_NAME, L.CITY
from COUNTRIES C, LOCATIONS L
where L.COUNTRY_ID(+) = C.COUNTRY_ID;



/*
employees 테이블과 departments 테이블을 
departments 테이블의 department_id를 기준으로 외부조인하여 
employee_id, first_name, last_name, department_name을 
employee_id를 기준으로 정렬하여 조회
*/
select E.employee_id, E.first_name, E.last_name, D.department_name
from EMPLOYEES E, DEPARTMENTS D
where D.DEPARTMENT_ID(+) = E.DEPARTMENT_ID
order by E.employee_id;

select * from DEPARTMENTS;


/*
employees 테이블을 manager_id와 employee_id를 기준으로 자체조인 한 뒤에
직원의 first_name과 last_name을 결합하고 관리자의 first_name과 last_name을 결합하여
employees_id를 기준으로 정렬하여 조회
*/
select concat(M.first_name, ' ' || M.last_name)as manager, 
    concat(E.first_name, ' ' ||  E.last_name)as name
from employees E, employees M
where M.employee_id = E.manager_id
order by M.employee_id;


/*
    서브 쿼리 
    >> 단일 행 서브 쿼리
    =  <>  !=  >  >=  <  <=   다 가능
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

/*  다중 서브쿼리  */

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


/* EXISTS () 괄호 안이 트루이면    */
select*
from EMPLOYEES
where EXISTS (
    select *
    from EMPLOYEES
    where employee_id=100
);

--any/some () : () 중 하나라도 만족시키면 true
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

--all() : ()안을 다 만족시켜야 함
--exists() : ()안에 값이 하나라도 존재하면 true >> 특정 서브쿼리 결과 값의 존재 유무를 통해 
                                          -- 메인 쿼리의 데이터 노출 여부를 결정해야 할 때 사용


/*
departments 테이블에서 department_name이 'IT'인
department_id와 일치하는 employees테이블의 
first_name, last_name, job_id, salary를 조회
*/
select first_name, last_name, job_id, salary, DEPARTMENT_ID
from EMPLOYEES
where department_id = (select department_id
                        from DEPARTMENTS
                        where department_name = 'IT'
                        );


/*
locations 테이블에서 state_province이 'California'인
location_id와 일치하는 departments 테이블의 
department_id, department_name을 조회
*/
select department_id, department_name, LOCATION_ID
from DEPARTMENTS
where LOCATION_ID = (select location_id
                    from LOCATIONS
                    where state_province = 'California'
                    );

/*
countries 테이블에서 region_id 가 3인 country_id가 포함된
locations 테이블의 city, state_province, street_address를 조회
*/
select city, state_province, street_address , COUNTRY_ID
from locations
where COUNTRY_ID in (select country_id
                    from COUNTRIES
                    where region_id = 3);

/*
departments 테이블에서 manager_id가 null이 아닌
department_id와 일치하는 employees 테이블의 
first_name, last_name, job_id, salary를 조회
*/
select FIRST_NAME, LAST_NAME, JOB_ID, SALARY
from EMPLOYEES
where DEPARTMENT_ID in (select department_id
                        from DEPARTMENTS
                        where manager_id is not null);
-- selet() 안에 데이터가 하나면 = 이걸로 해줄 수 있지만 여러개면 in 으로 찾아야 한다.

/*
    locations 테이블에서 city가 'Seattle'를 포함하지 않는
    location_id와 일치하는 departments 테이블의 
    department_id, department_name을 조회
*/
select department_id, department_name, location_id
from DEPARTMENTS
where LOCATION_ID in ( select location_id
                    from LOCATIONS
                    where city not in 'Seattle');

select city
from LOCATIONS;

/*
regions 테이블에서 region_name 이 'Europe'인 region_id가
일치하는 countries 테이블에서 country_id가 포함된 locations 테이블의
city, state_province, street_address를 조회
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
CRUD ( creat(생성) read(읽기) update(갱신) delete(삭제) )
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
countries 테이블
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
countries 테이블
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