-- 1.Join.sql

/*
 * 조인(Join)?
 * - 특정 칼럼을 이용하여 두 개 이상의 테이블을 연결하는 DB 기법
 * - 유형 : 일반조인, 카테전 조인
 */

/*
 * 일반조인 절차
 * 1.기본키가 포함된 테이블 생성
 * 2.기본키가 포함된 테이블에 레코드 삽입
 * 3.외래키가 포함된 테이블 생성
 * 4.외래키가 포함된 테이블에 레코드 삽입
 * 
 * 조인 테이블 삭제 : 위 순서의 역순.
 */

-- 1단계 : 기본키가 포함된 테이블(상품) 생성
drop table product cascade constraint;
-- join 관계의 master table 삭제
create table product(
code char(4) primary key,
name varchar(30) not null
);

-- 2단계 : 기본키가 포함된 테이블에 레코드 삽입
insert into product values('p001','냉장고');
insert into product values('p002','세탁기');
insert into product values('p003','전화기');

-- 결과 확인
select * from product;

-- 3단계 : 외래키가 포함된 테이블(판매) 생성
create table sale(
code char(4) not null, --상품 코드
sdate date not null, -- 판매일
price int not null, -- 가격
foreign key(code) 
references product(code) --상품테이블에 code를 외래키 지정
);

-- 4단계 : 외래키가 포함된 레이블에 레코드 삽입
insert into sale values('p001','2016-05-10',850000);
insert into sale values('p002','2016-05-15',550000);
insert into sale values('p003','2016-05-20',150000);

select * from sale;
-- 무결성 제약조건 : 등록되지 않은 코드 사용
insert into sale values('p004','2016-05-20',150000);

-- join 으로 데이터 검색
select p.code, p.name, s.price, s.sdate
from product p, sale s
where p.code = s.code and p.name like '%기';

commit work; --작업내용을 db 반영


