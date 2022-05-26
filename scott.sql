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
order by sal desc, empno ;                
       
select * from SALGRADE;

/* 263p. Q3 
10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 
사원 정보, 부서정보를 출력
DEPTNO = 10 인 사원 중 DEPTNO=30 에는 존재하지 않는 JOB을 가진 사원들의
EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC 출력
*/
select E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
from EMP E, DEPT D
where E.DEPTNO = D.deptno and E.job not in(select A.job
                    from emp A
                    where A.deptno=30);


/* 263p. Q3 
직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보. 급여등급정보를 출력
JOB = 'SALESMAN' 인 사람들의 MAX(SAL) 보다 높은 급여를 받는 사원들의
EMPNO,ENAME,SAL,GRADE 조회
(단, 서브쿼리를 활용할때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준으로 정렬)
*/
-- 다중행 사용 x
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > (select MAX(SAL)
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

--다중행 사용 o
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > all (select SAL
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

select * from SALGRADE;
select * from emp;
