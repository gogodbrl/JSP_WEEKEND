select no, subject, writer, content, regdate from 
(select no, subject, writer, content, regdate,  rank() over(order by no desc) as ranking from boards )  
where ranking between 1 and 10;


select * from boards;
select * from members;

begin 
    for i in 1..13 loop
        insert into members(id, name, salary, address)
        values('hi'||i, '하이'||i, 1000, '한국삽니다');
    end loop ;
end;

commit;


create table boards_comment(
    num number primary key,
    name varchar(20) not null,
    groupno number default 0,
    orderno number default 0,
    depth number default 0
)

--drop table board_comment;

create sequence seq_boards_comment;

--currval 은 현재 nextval 해서 나온 값이다. 즉 nextval이 10이였으면 currval이 10이라는 의미임
insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '일길동', seq_boards_comment.currval, 0, 0);
commit;

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '일영희', seq_boards_comment.currval, 0, 0);

select * from boards_comment
order by groupno desc, orderno asc, depth asc;

delete from boards_comment;
drop SEQUENCE seq_boards_comment;

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '이길동', 1, 0, 1);

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '삼길동', seq_boards_comment.currval, 0, 0);
commit;

-- num : 시퀀스.nextval
-- groupno : 넘어온 groupno사용
-- orderno : 새로운 글이 올때마다 1증가
-- depth : 현재 depth에 1증가

-- 이길동이 일길동의 글에 댓글을 달았음
update boards_comment 
set orderno = orderno -1
where groupno = 1 and orderno > 0;

-- Boards테이블에 대댓글 컬럼 추가
alter table boards add ( groupno number default 0);
alter table boards add ( orderno number default 0);
alter table boards add ( depth number default 0);

desc boards;
insert into boards(no, subject, writer, content, groupno, orderno, depth) values(SEQTEST.nextval,'테스트','kim','테스트', SEQTEST.currval, 0, 0);

select * from boards;
update boards 
set groupno = no;
commit;

delete from boards
where writer is null;
commit;