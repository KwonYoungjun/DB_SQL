-- dataType.sql : Oracle 주요 자료형

create table student(
sid int primary key, 			-- 학번 : 기본키 (중복불가, null 불가)
name varchar(25) not null, 		-- 이름 : null 불가 varchar 가변길이 문자형
phone varchar(30) unique,		-- 전화번호 : 중복불가, 생략은 가능
email char(50),					-- 이메일 : 생략가능, 고정길이 문자형
enter_date date not null		-- 입학년도 : 날짜+시간, null 불가
);

-- 테이블 목록 검색
select * from tab;

/*
 * Oracle 주요 자료형
 * 1. number(n) : n 크기 만큼 숫자(정수, 실수) 저장
 * 2. int : 4바이트 정수 저장
 * 3. varchar2(n) (2는 생략 가능) : n 크기 만큼 가변길이 문자 저장
 * 4. char(n) : n 크기 만큼 고정길이 문자 저장
 * 5. date : 날짜 / 시간 저장 -sysdate : system의 날짜 / 시간 저장 
 * 
 */

/*
 * 제약조건
 * 1. primary key : 해당 칼럼을 기본키로 지정 (중복불가 + null 불가)
 * 2. not null : null값 허용 불가
 * 3. unique : 중복 불가 (null 허용) 
 * 
 */

/*
 * sequence?
 * - 시작값을 기준으로 일정한 값이 증가하는 객체
 * - 형식) create sequence 이름 increment by 증가값 start with 시작값;
 * - 삭제) drop sequence 이름;
 * - 한번 삭제된 시퀀스 번호는 재생이 불가
 */
drop sequence seq_sid;
create sequence seq_sid increment by 1 start with 1000;
--sql plus에서 spl> select seq_sid from dual; dual은 의사테이블같은것..
-- sequence 이용 학번 추가
insert into student values(seq_sid.nextval, '홍길동', '010-111-1111','hong@naver.com',sysdate);
insert into student values(seq_sid.nextval, '이순신', '010-222-222','lee@naver.com',sysdate);
insert into student values(seq_sid.nextval, '강감찬', '010-333-3333','kang@naver.com',sysdate);
select * from student

-- db 반영
commit work;


