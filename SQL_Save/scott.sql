--                                 220526

/* 262p. Q1 
ALLEN과 같은 직책(job)인 사원들의 사원 정보, 부서 정보를 출력
*/
select * from emp;
select * from dept;

select E.job, E.empno, E.ename, E.sal, E.deptno, D.dname
from EMP E, DEPT D
where E.deptno = D.DEPTNO and E.JOB  = ( 
                                    select JOB
                                    from emp 
                                    where ename ='ALLEN');


/* 262p. Q2
전체 사원의 평균 급여(SAL)보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여등급정보를
출력. 단, 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원번호 기준으로 오름차순 정렬.
EMP 테이블에서 avg(sal) < sal 인 사원들의 
EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL, GRADE 를 조회
단, SAL 이 많은 순으로 정렬 , SAL 이 같으면 EMPNO 기준 정렬
*/
select E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
from EMP E, DEPT D, SALGRADE S
where  E.DEPTNO = D.deptno 
and e.sal between s.losal and s.hisal
and E.SAL > (select avg(sal)
              from emp)
order by e.sal desc, e.empno ;                
       
select * from SALGRADE;



/* 263p. Q3 
10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 
사원 정보, 부서정보를 출력
DEPTNO = 10 인 사원 중 DEPTNO=30 에는 존재하지 않는 JOB을 가진 사원들의
EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC 출력
*/
select e.EMPNO, e.ENAME, e.JOB, e.DEPTNO, d.DNAME, d.LOC
from EMP E, DEPT D
where E.DEPTNO = D.DEPTNO
and E.DEPTNO =10
and job not in (select DISTINCT job
            from EMP
            where deptno=30); 

--distinct >> 중복x!! 


/* 263p. Q3 
직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보. 급여등급정보를 출력
JOB = 'SALESMAN' 인 사람들의 MAX(SAL) 보다 높은 급여를 받는 사원들의
EMPNO,ENAME,SAL,GRADE 조회
(단, 서브쿼리를 활용할때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 정렬)
*/
-- 다중행 사용 o??
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > all(select SAL
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

--다중행 사용 x...?  이게 단일행.....?
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > (select MAX(SAL)
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

select * from SALGRADE;
select * from emp;






/*p239 Q1
급여(SAL)가 2000 초과인 사원들의 부서 정보, 사원정보를 오른쪽과ㅡ같이 출력
*/
select D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
from EMP E, DEPT D
where E.DEPTNO = D.DEPTNO
and sal >2000
order by E.DEPTNO;

/*Q2
오른쪽과 같이 각 부서별 평균 급여, 최대급여, 최소급여,사원수를 출력
*/
select e.DEPTNO, d.DNAME, 
    trunc(AVG(SAL)) as AVG_SAL, 
    MAX(SAL) as MAX_SAL, 
    MIN(SAL) as MIN_SAL,
    count(SAL) as CNT
from emp e , DEPT d
where e.DEPTNO = d.DEPTNO
group by e.DEPTNO, d.DNAME;


desc SALGRADE;
  
/*Q3
모든 부서 정보와 사원정보를 오른쪽과 같이 부서번호, 사원이름순으로 정렬하여 출력
*/
--SQL-99 이전 방식(?)
select E.DEPTNO,D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
from DEPT D,EMP E
where E.DEPTNO(+) = D.DEPTNO
order by E.DEPTNO, E.ENAME;

--SQL-99 방식(?)
select DEPTNO,D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
from EMP E natural join DEPT D 
order by DEPTNO, E.ENAME;


/* Q3 
다음과 같이 모든 부서정보, 사원정보, 급여등급정보, 각 사원의 직속 상관의 정보를
부서번호, 사원 번호 순서로 정렬하여 출력
*/
select D.DEPTNO,D.DNAME,E.EMPNO,E.ENAME,E.MGR,E.SAL,E.DEPTNO,S.LOSAL,S.HISAL,S.GRADE
,M.EMPNO as MGR_EMPNO, M.ENAME as MGR_ENAME
from EMP E, DEPT D, SALGRADE S, EMP M
where E.DEPTNO(+) = D.DEPTNO 
and e.sal between s.losal(+) and s.hisal(+)
and M.EMPNO(+) = E.MGR
order by E.DEPTNO, E.EMPNO;


select*from dept;
(
    select M.EMPNO as MGR_EMPNO, M.ENAME as MGR_ENAME
    from EMP E, EMP M
    where M.EMPNO = E.MGR
);

