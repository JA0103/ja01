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






