--                                 220526

/* 262p. Q1 
ALLEN�� ���� ��å(job)�� ������� ��� ����, �μ� ������ ���
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
��ü ����� ��� �޿�(SAL)���� ���� �޿��� �޴� ������� �������, �μ�����, �޿����������
���. ��, �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� �����ȣ �������� �������� ����.
EMP ���̺��� avg(sal) < sal �� ������� 
EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL, GRADE �� ��ȸ
��, SAL �� ���� ������ ���� , SAL �� ������ EMPNO ���� ����
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
10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� 
��� ����, �μ������� ���
DEPTNO = 10 �� ��� �� DEPTNO=30 ���� �������� �ʴ� JOB�� ���� �������
EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC ���
*/
select e.EMPNO, e.ENAME, e.JOB, e.DEPTNO, d.DNAME, d.LOC
from EMP E, DEPT D
where E.DEPTNO = D.DEPTNO
and E.DEPTNO =10
and job not in (select DISTINCT job
            from EMP
            where deptno=30); 

--distinct >> �ߺ�x!! 


/* 263p. Q3 
��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������. �޿���������� ���
JOB = 'SALESMAN' �� ������� MAX(SAL) ���� ���� �޿��� �޴� �������
EMPNO,ENAME,SAL,GRADE ��ȸ
(��, ���������� Ȱ���Ҷ� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� ����)
*/
-- ������ ��� o??
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > all(select SAL
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

--������ ��� x...?  �̰� ������.....?
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
�޿�(SAL)�� 2000 �ʰ��� ������� �μ� ����, ��������� �����ʰ��Ѱ��� ���
*/
select D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
from EMP E, DEPT D
where E.DEPTNO = D.DEPTNO
and sal >2000
order by E.DEPTNO;

/*Q2
�����ʰ� ���� �� �μ��� ��� �޿�, �ִ�޿�, �ּұ޿�,������� ���
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
��� �μ� ������ ��������� �����ʰ� ���� �μ���ȣ, ����̸������� �����Ͽ� ���
*/
--SQL-99 ���� ���(?)
select E.DEPTNO,D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
from DEPT D,EMP E
where E.DEPTNO(+) = D.DEPTNO
order by E.DEPTNO, E.ENAME;

--SQL-99 ���(?)
select DEPTNO,D.DNAME, E.EMPNO,E.ENAME,E.JOB,E.SAL
from EMP E natural join DEPT D 
order by DEPTNO, E.ENAME;


/* Q3 
������ ���� ��� �μ�����, �������, �޿��������, �� ����� ���� ����� ������
�μ���ȣ, ��� ��ȣ ������ �����Ͽ� ���
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

