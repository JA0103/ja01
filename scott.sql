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
order by sal desc, empno ;                
       
select * from SALGRADE;

/* 263p. Q3 
10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� 
��� ����, �μ������� ���
DEPTNO = 10 �� ��� �� DEPTNO=30 ���� �������� �ʴ� JOB�� ���� �������
EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC ���
*/
select E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
from EMP E, DEPT D
where E.DEPTNO = D.deptno and E.job not in(select A.job
                    from emp A
                    where A.deptno=30);


/* 263p. Q3 
��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������. �޿���������� ���
JOB = 'SALESMAN' �� ������� MAX(SAL) ���� ���� �޿��� �޴� �������
EMPNO,ENAME,SAL,GRADE ��ȸ
(��, ���������� Ȱ���Ҷ� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� �������� ����)
*/
-- ������ ��� x
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > (select MAX(SAL)
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

--������ ��� o
select E.EMPNO,E.ENAME,E.SAL,S.GRADE
from EMP E, SALGRADE S
where e.sal between s.losal and s.hisal
and SAL > all (select SAL
            from EMP
            where JOB = 'SALESMAN')
order by E.EMPNO;

select * from SALGRADE;
select * from emp;
