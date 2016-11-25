-- DDL Example.sql

-- 1. 실수형 데이터 저장 테이블
create table EMP01(
empno number(4),
ename varchar(20),
sal number(7,2) --- (전체, 소숫점)
);

insert into emp01 values(1,'홍길동',1234.12);
insert into emp01 values(2,'이순신',12345.12345);
--insert into emp01 values(3,'홍길동',123456.12345); 
--오류발생. 소숫점 포함 7자리 소숫점은 2자리 확보해야하는데 정수 6자리이기 때문에
select * from emp01;

-- 2. 서브 쿼리 이용 테이블 생성
create table emp02
as
select * from emp;

select * from emp02;

-- 3. 특정 칼럼만 복사
create table emp03
as
select empno, ename from emp;
select * from emp03;

-- 과제
create table emp04
as
select empno, ename, sal from emp;
select * from emp04;

-- 4. 특정 레코드 이용 테이블 생성
create table emp05
as
select * from emp where sal >= 2500; 
-- sal > 2500 만족하는 값만 emp05 테이블에 저장, 내용+구조 복사(특정 레코드)

-- 5. 구조 복사로 테이블 생성
create table emp06
as
select * from emp where 1 = 0; -- 조건식을 false로 지정
select * from emp06; --구조만 복사(내용은 없음)

-- 6. 외래키
create table dept_tab(
deptno number(2) primary key, -- 기본키 : 컬럼 레벨 제약조건
dname varchar(15),
loc varchar(50)
);


insert into dept_tab values(1,'영업부', '서울');
insert into dept_tab values(2,'기획실', '대전');
select * from dept_tab;

create table emp_tab(
empno number(4),
ename varchar(30),
sal number(7),
deptno number(2) not null,
foreign key(deptno) references dept_tab(deptno) -- deptno 는 외래키
);

-- 외래키 : 다른 테이블의 기본키를 참조하는 칼럼

insert into emp_tab values(1001,'홍길동',2500000,1);
insert into emp_tab values(1002,'이순신',3000000,2);
-- insert into dept_tab values(1003,'유관순',2000000,3);
-- error : 무결성 제약조건

select * from emp_tab;

-- 7.UNIQUE : 중복불가 NULL 허용
create table uni_tab(
deptno number(2) unique,
dname varchar(20),
loc varchar(2)
);

insert into uni_tab(01, '영업부', '서울');
insert into uni_tab(02, '총무부', '대전');
insert into uni_tab(02, '총무부', '대전'); --error
insert into uni_tab(dname, loc) values('회계부','광주');

-- 8.CHECK
create table chk_tab(
deptno number(2) not NULL check (deptno in 10,20,30,40),
dname varchar(20),
loc varchar(10)
);

insert  into chk_tab values(10,'영업부','서울');
insert  into chk_tab values(40,'회계부','대전');
insert  into chk_tab values(50,'총무부','대전'); --error
select * from chk_tab;

-- 9. 전체 레코드 삭제
TRUNCATE TABLE chk_tab;

