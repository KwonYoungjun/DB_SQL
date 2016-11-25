--SubQuery.sql

/*
 * 형식1)
 * main query
 * as
 * sub query;
 * 
 * 형식2)
 * main query 관계연산자 (sub query); 두번째 형식을 많이 사용한다
 * 
 */

-- deptno 칼럼
select * from emp;
select * from dept;

-- 형식1) 테이블 검색(sub) -> 테이블 생성(main)
create table dept01
as
select * from DEPT;
-- dept(원본) -> dept01(사본) : 내용, 구조 동일
select * from dept01;
insert into dept01 values(50, 'ACCOUNTING', 'NEW YORK');

-- 형식2) main : DEPT, sub : EMP
select deptno, dname
from DEPT
where deptno = (select deptno from EMP where ename = 'SCOTT');

-- 실습1)
select ename, deptno from EMP
where deptno= (select deptno from EMP where ename = 'SCOTT');

-- 실습2)
select * from EMP
where mgr = (select mgr from emp where ename = 'SCOTT');

-- 실습3)
select ename, sal from EMP 
where sal >= (select sal from emp where ename = 'SCOTT');

-- 실습4)
select ename, deptno from EMP
where deptno = (select deptno from dept01 where loc = 'DALLAS');

-- 실습5)
select ename, sal from EMP
where deptno = (select deptno from dept01 where dname = 'SALES');

-- 03. 서브 쿼리에서 그룹 함수의 사용
select avg(sal) from EMP;

select ename, sal from EMP
where sal > (select avg(sal) from EMP);

-- 04. 다중 행 서브 쿼리
-- 1) IN 
select ename, sal, deptno from EMP
where deptno IN (select distinct deptno from emp where sal >= 3000); --in(10,20,30)

-- 실습
select deptno, dname, loc from dept
where deptno IN (select distinct deptno 
				 from emp 
				 where job = 'MANAGER') 
				 order by deptno asc; --in(10,20,30) 정렬은 서브쿼리 뒤에

-- 2) ALL : 최댓값
select ename, sal from EMP
where sal > ALL(select sal from EMP where deptno = 30);

-- 실습
select ename, sal, job from EMP
where sal > ALL(select sal from EMP where job = 'SALESMAN');

-- 3) ANY : 최솟값
select ename, sal from EMP
where sal > ANY(select sal from EMP where deptno = 30);

-- 실습
select ename, sal, job from EMP
where sal > ANY(select sal from EMP where job = 'SALESMAN') AND job != 'SALESMAN';