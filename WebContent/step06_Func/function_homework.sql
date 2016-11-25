/*
 * 주요 함수 
 * 작업 대상 테이블 : STUDENT, EMP, PROFESSOR 
 */

--Q1. STUDENT 테이블에서 JUMIN 칼럼을 사용하여 
-- 태어난 달이 8월인 사람의 이름과 생년월일 출력하기
-- 힌트 : substr() 함수 이용
select * from student;
select name, birthday from student where substr(jumin,3,2) = '08';

--Q2. EMP 테이블에서 사번이 홀수인 사람들을 검색하기
-- 힌트 : mod() 함수 이용
select * from EMP;
select * from EMP where mod(empno,2) != 0;

--Q3. Professor 테이블에서 교수명, 급여, 보너스, 연봉을 출력하기 
-- 조건) 연봉 = pay*12+bonus 으로 계산, bonus가 없으면 급여 0 처리
-- 힌트 : nvl2() 함수 이용
select * from professor;
select name, pay, nvl(bonus,0), pay*12+nvl(bonus,0) from PROFESSOR;
select name, pay, nvl(bonus,0), nvl2(bonus,pay*12+bonus,pay*12) from professor;

--Q4. Professor 테이블에서 교수명, 학과명을 출력하되 
--  deptno가 101번이면 ‘컴퓨터 공학과’, 102번이면 
-- ‘멀티미디어 공학과’, 103번이면 ‘소프트웨어 공학과’, 
-- 나머지는 ‘기타학과’로 출력하기
-- decode()함수 이용
select * from professor;
select name, decode(deptno,101,'컴퓨터 공학과',
			 decode(deptno,102,'멀티미디어 공학과',
			 decode(deptno,103,'소프트웨어 공학과','기타학과'))) 
from professor;

/*
 * 집합 함수(COUNT,MAX,MIN,SUM,AVG) 
 * 작업 대상 테이블 : EMP, STUDENT, PROFESSOR
 */
--Q1. EMP 테이블에서 소속 부서별 최대 급여와 최소 급여 구하기
select * from EMP;
select job, max(sal), min(sal) from EMP group by job;

--Q2. EMP 테이블에서 JOB의 수 출력하기
select * from EMP;
select count(distinct job) from EMP;

--Q3. Professor 테이블에서 학과별,직위별 급여(pay) 평균 구하기
select * from PROFESSOR;
select deptno, position, avg(nvl(pay,0)) from PROFESSOR group by deptno, position 
order by deptno, position;


--Q4. Student 테이블에서 grade별로 
-- weight, height의 평균값, 최대값, 최소값을 구한 
-- 결과에서 키의 평균이 170 이하인 경우 구하기
select * from student;
select grade, avg(weight), max(weight), min(weight),
	          avg(height), max(height), min(height)
from students
group by grade
having avg(height) <= 170;
