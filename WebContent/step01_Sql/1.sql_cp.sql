-- sql_cp.sql

/*
  SQL : 구조화된 질의 언어
  - DDL, DML, DCL
 1. DDL : 데이터 정의어 -> DBA(관리자), USER 사용. (TABLE 생성, 구조변경, 삭제)
 2. DML : 데이터 조작어 -> USER 사용. (SELECT, INSERT, DELETE, UPDATE) (SELECT 는 구조변경에 영향을 미치지 않음, 나머지는 구조변경에 영향을 미침)
 3. DCL : 데이터 제어어 -> DBA 사용. 권한설정, 사용자 등록 등
*/

-- 1. DDL : 데이터 정의어

-- 1) TABLE 생성
/*
 * create table 테이블명(
 *   칼럼명 데이터형 [제약조건], 
 *   칼럼명 데이터형
 * );
 */

create table test2(
id varchar(20) primary key, --중복 검사 밑 not null
pwd varchar(30) not null,
name varchar(25) not null
);

-- table 확인
select * from tab; -- scott 사용자의 전체 테이블
select * from test2; -- 현재 테이블 구조

-- 2) Table 구조 변경
-- (1) 테이블 이름 변경
-- 형식) alter table 구테이블명 rename to 새테이블명
alter table test2 rename to member;

-- (2) 테이블 칼럼 추가
-- 형식) alter table 테이블명 add (칼럼명 자료형(크기))
alter table member add (reg_date date);
select * from member;

-- (3) 테이블 칼럼 수정 : 이름변경,type, 제약조건 수정
-- 형식) alter table 테이블명 modify (칼럼명 자료형)
alter table member modify (pwd varchar(50)); 

-- (4) 테이블 칼럼 삭제
-- 형식) alter table 테이블명 column drop 칼럼명;
alter table member column drop reg_date;
select * from member;

-- 3) Table 제거
-- 형식) drop table 테이블명 purge;
-- purge 속성 : 임시파일 제거

drop table member;
select * from tab;
purge recyclebin; --임시파일 제거

-- 2. DML : 데이터 조작어
create table depart(
dno number(4), --정수만 쓸땐 int, 실수까지 쓸땐 number. 4자리까지
dname varchar(50),
daddress varchar(100)
);

-- 1) insert : 레코드 삽입
-- 형식) insert into 테이블명(칼럼명1,...,칼럼명n) values(값1,...값n);
insert into depart(dno,dname,daddress) values(1001,'기획실','서울시');
-- 전체 칼럼 대상인 경우 칼럼명 생략 가능
insert into depart values(1002,'영업부','대전시');


-- 2) select : 레코드 검색
-- 형식) select 칼럼명 from 테이블명 [where 조건식];
select * from depart; -- * : 전체 칼럼
select dno,daddress from depart;
select * from depart where dname='영업부'
select * from depart order by dno desc; -- 부서코드 기준 내림차순 정렬

-- 3) update : 레코드 수정
-- 형식) update 테이블명 set 칼럼명 = 값 where 조건식;
update depart set dname = '영업팀' where dno = 1002; -- 영업부 -> 영업팀으로 변경
select * from depart; 

-- 4) delete : 레코드 삭제
-- 형식) delete from 테이블명 where 조건식;
delete from depart where dno = 1002;
delete from depart -- 주의 : 조건식 생략하면 전체 레코드 삭제;
select * from depart;

drop table depart purge;
select * from tab;

-- 3. DCL : 데이터 제어어
-- 1) 권한 설정 : grant 권한,... to user;
-- 2) 권한 해제 : revoke 권한,... to user;