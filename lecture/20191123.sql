select * from members ;

select * from boards;

insert into oraman.boards(no, subject, writer, content)
values(SEQTEST.nextval, '�౸�Ͻ�?', 'son', '�ο�����');

commit;

--delete from boards;

select * from boards;

/** SEQUENCE CREATE **/
create sequence oraman.seqtest;
drop sequence oraman.seqtest;

/** ORACLE PROCEDURE **/
/** begin end �� �ִ°� ���ν����� **/
begin 
    for i in 1..13 loop
        insert into oraman.boards(no, subject, writer, content)
        values(SEQTEST.nextval, '�౸�Ͻ�? �ο�����-' || i, 'son', '�ο�����');
    end loop ;
end;

-- top n 
select no, subject, writer, content, regdate
from (
    select no, subject, writer, content, regdate, 
    rank() over(order by no desc) as ranking
    from boards
)
where ranking between 1 and 10;
