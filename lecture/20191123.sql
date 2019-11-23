select * from members ;

select * from boards;

insert into oraman.boards(no, subject, writer, content)
values(SEQTEST.nextval, '축구하실?', 'son', '인원모집');

commit;

--delete from boards;

select * from boards;

/** SEQUENCE CREATE **/
create sequence oraman.seqtest;
drop sequence oraman.seqtest;

/** ORACLE PROCEDURE **/
/** begin end 에 있는거 전부실행함 **/
begin 
    for i in 1..13 loop
        insert into oraman.boards(no, subject, writer, content)
        values(SEQTEST.nextval, '축구하실? 인원모집-' || i, 'son', '인원모집');
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
