-- DML_SEQ example.sql

-- 실습1) 서브쿼리 이용 구조복사 테이블 생성

drop table sam01 purge;
purge recyclebin;
select * from tab;

create table sam01
as
select empno, ename, job, sal
from EMP where 0 =1;

desc sam01; -- sql plus 에서 실행
select * from sam01;

-- 실습2) 레코드 추가
insert into SAM01 values(1000,'APPLE','POLICE',10000);
insert into SAM01 values(1010,'BANANA','NURSE',15000);
insert into SAM01 values(1020,'ORANGE','DOCTOR',25000);

select * from sam01;
--sql plus에서 desc sam01; 을 해본 결과 모든 칼럼이 NULL 값을 가질수있음.

-- NULL 삽입 예
select * from dept01;
insert into dept01 values(60,'서울',NULL); --명시적
insert into dept01(deptno, dname) values(70,'BUSAN'); --묵시적

insert into sam01 values(1030,'VERY',NULL,25000);
insert into sam01(empno,ename,sal) values (1040,'CAT',2000);

-- 서브쿼리 이용 레코드 추가
create table dept02 -- 테이블 생성(구조)
as
select * from dept where 0 = 1;

insert into dept02  -- 레코드 추가
select * from dept;

select * from dept02;

insert into sam01
select empno, ename, job, sal from EMP where deptno = 10;
select * from sam01;

-- 다중 테이블 레코드 삽입
create table emp_hir -- 테이블 생성(EMP와 같은 구조, 몇개의 칼럼만 가져오기)
as
select empno, ename, hiredate from EMP
where 0 = 1;

create table emp_mgr -- 테이블 생성(EMP와 같은 구조, 몇개의 칼럼만 가져오기)
as
select empno, ename, mgr from EMP
where 0 = 1;alter

select * from tab;

INSERT ALL 
INTO EMP_HIR VALUES(EMPNO, ENAME, HIREDATE) 
INTO EMP_MGR VALUES(EMPNO, ENAME, MGR) 
SELECT EMPNO, ENAME, HIREDATE, MGR FROM EMP 
WHERE DEPTNO=20;

select * from emp_hir;
select * from emp_mgr;

select * from emp01;
UPDATE emp01 set sal = sal * 1.1

drop table emp01 purge;
purge recyclebin;

create table emp01
as
select * from emp;

-- 실습5)
UPDATE sam01
set sal = sal - 5000 where sal >= 10000;
select * from sam01;

-- 서브쿼리 이용 레코드 수정
UPDATE DEPT01
SET LOC = (SELECT LOC
		   FROM DEPT01
		   WHERE DEPTNO=10)
		   WHERE DEPTNO=20;
		   
UPDATE DEPT01 SET LOC = 'NEW YORK'
WHERE DEPTNO = 20; --위와 같은 의미

-- 실습6)
drop table sam02 purge;
purge recyclebin;
create table sam02
as
select ename,sal,hiredate,deptno from EMP;

-- 실습7
select * from sam02;
update sam02
set sal = sal + 1000
where deptno in
(select deptno from emp where deptno = 20);

-- 실습 8
select * from sam02;

update sam02
set (sal, hiredate) = (select sal, hiredate from sam02 where ename = 'KING');

-- 실습 9
select * from sam01;

delete from sam01 where job is NULL;

-- sequence 다음값/현재값 확인
select seq_sid.nextval from dual;
select seq_sid.currval from dual; -- nextval 실행 이후 확인


