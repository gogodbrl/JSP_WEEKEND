create table oraman.members(
    id varchar2(10) primary key,
    name varchar2(255),
    salary number(8,2),
    hiredate date default sysdate,
    address varchar2(255)
);

insert into oraman.members(id, name, salary, hiredate,  address)
values ('kim2', '김정아', 1000, '1990/12/25', '강남구 역삼동');

commit;

update members set address='용산구 삼각지역'
where id='hong';

insert into members(id, name, salary, hiredate, address)
values ('kim', '김철수', 5000, '1992/11/09', '은평구 응암동');

update members set address = '은평구 123', salary = 5000 
where id='kim';

delete from members;
rollback;

select * from members;

-- dual ( dummy ) 
select UPPER('abcd') from dual;

create sequence seqtest;
create table boards(
    no number primary key,
    subject varchar2(255),
    writer varchar2(255),
    content varchar2(255),
    regdate date default sysdate
);
-- writer가 아닌 사람들은 insert하지 못하게 한다.
-- 참조무결성 제약조건
alter table boards
add constraint boards_fk1111
foreign key(writer) references members(id)
on delete set null;

insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '가가', 'hong', '재미있는 글');

-- 제약조건 위배 ( member 테이블에 없는 writer는 insert 되지 않는다.)
insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '나나', 'kang', '재미있는 글_hong');

insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '다다', 'kim', '재미있는 글_kim');

commit;

select * from boards;

-- 조회구문
select * 
from 테이블
where 조건절
[group by 그룹핑]
[having 그룹핑조건절]
[order by 정렬];

select name, hiredate
from members;

--alias 
select 
name as "이름",
12 * salary as "연봉"
from members;

select * from members
where id='hong' or id='kim';

select * from members where name like '%희';

select * from members where name like '김%';

select * from members where name like '%a%';

select * from members 
where salary >= 1000 and salary <=2500;

select * from members
where salary between 1000 and 2500;

--select는 commit이 필요없고
--insert, update, delete는 commit을 해야하고
-- create나 alter등은 commit이랑 전혀 관련이 없다.

-- null : 비교 판단이 불가능한 알 수 없는 값
select * from members 
--이렇게 하면 값이 "없는" 것이 되고
where salary is null;

select * from members
--이렇게 하면 "비교를 할 수 없는" 것이 됨.
where salary = null;

-- 부정어
-- not in, not like, not between, is not null

-- 정렬
-- asc(기본) : 오름차순
-- desc : 내림차순
-- desc 테이블 : 테이블 구조 간략 보기
desc members;

select * from members 
order by hiredate desc;

select * from members 
order by name desc;

select * from members 
order by name asc;

-- 급여가 낮은 순으로 정렬하되 이름은 역순으로 정렬
select * from members
order by salary asc, name desc;

-- 그룹함수 : min, max, avg, sum, count 
-- HAVING 절 : 그룹함수 컬럼에 대한 조건절을 주고 싶을 때 사용
select max(salary)
from members;

-- 서브 쿼리
-- 최대 급여를 받는 자의 아이디와 이름은?
select id,name from members
where salary = (
    select max(salary)
    from members
);

--평균 급여보다 적게 받는 사람의 이름?
select name from members
where salary < (
    select avg(salary)
    from members
);

-- 다중행 서브쿼리
--게시물을 남기지 않는 사람의 이름?
select name from members
where id not in (
    select distinct(writer) from boards
);
--널리 : 부트스트랩 같은거
--(https://nuli.navercorp.com/sharing/ui/patternPaginate/6)

-- JOIN ( 2개 이상의 테이블을 하쳐서 조회하기 ) 
-- 게시물을 남긴 사람의 이름과 급여 조회
select * from members;
select * from boards;

select * from members
left join boards
on members.id = boards.writer;

select m.name, m.salary, b.subject, b.content
from members m join boards b
on m.id = b.writer;


-- 게시물 작성자 id와 작성 건수를 조회하세요.
select writer, count(*)
from boards
group by writer