--select_example.sql

select * from emp; -- * : 모든 칼럼 의미
select empno, ename, sal from emp; -- 특정 칼럼 조회
select empno, ename, sal, sal+500 from emp; -- 사칙연산 적용
select empno, ename, sal, comm, sal+comm from emp; -- null 칼럼과 연산 null+숫자 = null
--null 처리 함수
select empno, ename, sal, comm, sal+nvl(comm,0) from emp; -- nvl은 null 값을 다른것으로 변환

-- 별칭
select empno, ename, sal, comm, sal+nvl(comm,0) AS 실급여 from emp;
-- 칼럼과 칼럼 연결자
select empno, ename ||' '|| nvl(comm,0) as 실급여 from emp;
-- 띄어쓰기를 포함한 별칭은 "" 꼭 붙여야함
select empno, ename ||' '|| nvl(comm,0) as "실 급여" from emp;

-- 중복되지 않은 직책 보기
select distinct job from emp;


--<연습문제>
select empno, ename, sal as "12 년봉" from emp;
select * from emp;
select distinct empno from emp;
select ename ||' '|| job from emp;
select * from dept;
select dname ||' '|| loc as "부서 위치" from dept;
select job ||' '|| sal as "직위와급여" from emp;

select * from emp where sal >= 3000; -- 조건 검색
select * from emp where job = 'MANAGER'; -- 문자는 항상 ' ' 로 표현.
select * from emp where hiredate >= to_date('1982/01/01','yyyy/mm/dd');
--to date('문자열', format) : 문자열 -> 날짜형

SELECT ename, job, sal, deptno
FROM emp
WHERE sal BETWEEN 1300 AND 1500;

SELECT empno,ename,job,sal,hiredate
FROM emp
WHERE empno IN (7902,7788,7566);

-- LIKE 이용 포함문자 검색
select * from student;
select * from student where name like '서%'; -- 서씨 검색
select * from student where name like '%수'; -- 수로 끝나는 학생
select * from student where name like '%재%'; -- '재'를 포함한 학생

SELECT empno,ename,job,sal,comm,deptno
FROM emp
WHERE comm IS NOT NULL; -- NULL 이 없는 것들

select * from emp where comm is not null order by sal desc; -- desc는 내림차순, 생략하면 오름차순

select * from emp;

										--<연습문제 2>
--1. sal이 3000이상인 사원의 empno, ename, job, sal 출력
select empno, ename, job, sal from emp where sal >= 3000;
--2. empno가 7788인 사원의 ename, deptno 출력
select ename, deptno from emp where empno=7788;
--3. hiredate가 1982년 2월 20일과 1982년 5월 1일 사이 hiredate 순으로 출력
select ename, job, hiredate from emp 
where hiredate between to_date('1981/02/20','yyyy/mm/dd') and to_date('1981/05/01','yyyy/mm/dd')
order by hiredate;
--where hiredate between '81/02/20' and '81/05/01'
--4. deptno가 10,20인 사원의 모든 정보를 출력
select * from emp where deptno in (10,20) order by ename;
--5. sal이 1500이상이고 deptno가 10,30인 사원의 ename과 sal 출력
select ename, sal from emp where sal >= 1500 AND deptno in (10,20);
--6. hiredate가 1982년인 사원의 모든 정보 출력
select * from emp where hiredate between like '82%';
--'82/01/01' and '82/12/31';
--7. comm에 NULL이 아닌 사원의 모든 정보를 출력
select * from emp where comm is not NULL;
--8. comm이 sal보다 10%가 많은 모든 사원에 대하여 ename, sal, comm 출력
select ename, sal, comm from emp where comm >= (1.1)*sal;
--9. job이 CLERK 거나 ANALYST이고 sal이 1000,3000,5000이 아닌 모든 사원 출력
select * from emp where (job='CLERK' OR job='ANALYST') AND sal not in (1000,3000,5000);
--10. ename에 L이 두 자가 있고 deptno가 30이거나 또는 mgr이 7782인 모든 정보 출력
select * from emp where ename like '%L%L%' AND (deptno=30 OR mgr=7782);