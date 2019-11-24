select no, subject, writer, content, regdate from 
(select no, subject, writer, content, regdate,  rank() over(order by no desc) as ranking from boards )  
where ranking between 1 and 10;


select * from boards;
select * from members;

begin 
    for i in 1..13 loop
        insert into members(id, name, salary, address)
        values('hi'||i, '����'||i, 1000, '�ѱ���ϴ�');
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

--currval �� ���� nextval �ؼ� ���� ���̴�. �� nextval�� 10�̿����� currval�� 10�̶�� �ǹ���
insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '�ϱ浿', seq_boards_comment.currval, 0, 0);
commit;

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '�Ͽ���', seq_boards_comment.currval, 0, 0);

select * from boards_comment
order by groupno desc, orderno asc, depth asc;

delete from boards_comment;
drop SEQUENCE seq_boards_comment;

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '�̱浿', 1, 0, 1);

insert into boards_comment (num, name, groupno, orderno, depth)
values (seq_boards_comment.nextval, '��浿', seq_boards_comment.currval, 0, 0);
commit;

-- num : ������.nextval
-- groupno : �Ѿ�� groupno���
-- orderno : ���ο� ���� �ö����� 1����
-- depth : ���� depth�� 1����

-- �̱浿�� �ϱ浿�� �ۿ� ����� �޾���
update boards_comment 
set orderno = orderno -1
where groupno = 1 and orderno > 0;

-- Boards���̺� ���� �÷� �߰�
alter table boards add ( groupno number default 0);
alter table boards add ( orderno number default 0);
alter table boards add ( depth number default 0);

desc boards;
insert into boards(no, subject, writer, content, groupno, orderno, depth) values(SEQTEST.nextval,'�׽�Ʈ','kim','�׽�Ʈ', SEQTEST.currval, 0, 0);

select * from boards;
update boards 
set groupno = no;
commit;

delete from boards
where writer is null;
commit;