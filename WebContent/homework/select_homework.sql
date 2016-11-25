
--[문1] gift 테이블을 대상으로 각 필드에 별칭을 사용하여 출력
-- <출력 형식>
--  선물코드   시작코드       종료코드 
--          1        1              100000
--          2        100001     200000 
select * from gift;
select gno as "선물코드", g_start as " 시작코드", g_end as "종료코드" from gift;

-- [문2] emp에서 30번 부서에 근무하는 사원의 
--  이름(ename),급여(sal),사번(empno) 출력하기
select ename, sal, empno from emp where deptno = 30;

-- [문3] student 테이블을 사용하여 모든 학생들이 
-- '서진수의 키는 180cm,몸무게는 55kg 입니다'와 
-- 같은 형식으로 출력되도록 리터럴 문자를 추가한다. 
-- 컬럼 : 키(height), 몸무게(weight)
--[조회결과 예시] 홍길동의 키는 175cm, 몸무게는 65kg입니다.
select name || '의 키는' || height || 'cm, 몸무게는' || weight ||'kg입니다.' from student; 

--[문4] student 테이블을 사용하여 2학년 중에서 키가 180cm 보다 
-- 크면서 몸무게가 70kg 보다 큰 학생들의 이름,학년,키,몸무게 조회
-- 컬럼 : 이름(name), 학년(grade), 키(height), 몸무게(weight)
select name, grade, height, weight from student 
where grade = 2 AND (height > 180 AND height >70);      

--[문5] student 테이블을 사용하여 1학년 학생의 이름과  키, 몸무게를 출력. 
-- (단, 키는 작은 순서대로 출력하고 몸무게는 많은 사람부터 출력)
select name, height, weight from student where grade = 1 order by height asc, weight desc;    

--[문6] student 테이블을 사용하여 1학년 학생의 이름과  키를 출력(별칭 이용). 
--  (단, 이름을 오름차순으로 정렬)
select name as "이름", height as "키" from student where grade = 1 order by name asc;      

--[문7] professor 테이블에서 교수들의 이름을 조회하여 
-- 성 부분에 'ㅈ'과 'ㅊ'이 포함된 사람의 이름을 오름차순으로 출력
select name from professor where name between '자' and '치' order by name asc; 

--[문8] professor 테이블를 대상으로 '전임'만 입력하면 전임강사가 
-- 모두 검색 되도록한다(컬럼 : position)
select * from professor where position like '%전임%';

--scott 사용자가 작성한 모든 테이블 목록보기
--select 컬럼명(*) from 테이블명;
select * from tab; --tab(의사테이블)
select tname from tab; --tname : 테이블이름 컬럼(의사컬럼)

select tname from tab where tname = 'STUDENT'; --테이블 검색?