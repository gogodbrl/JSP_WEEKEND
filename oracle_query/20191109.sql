create table oraman.members(
    id varchar2(10) primary key,
    name varchar2(255),
    salary number(8,2),
    hiredate date default sysdate,
    address varchar2(255)
);

insert into oraman.members(id, name, salary, hiredate,  address)
values ('kim2', '������', 1000, '1990/12/25', '������ ���ﵿ');

commit;

update members set address='��걸 �ﰢ����'
where id='hong';

insert into members(id, name, salary, hiredate, address)
values ('kim', '��ö��', 5000, '1992/11/09', '���� ���ϵ�');

update members set address = '���� 123', salary = 5000 
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
-- writer�� �ƴ� ������� insert���� ���ϰ� �Ѵ�.
-- �������Ἲ ��������
alter table boards
add constraint boards_fk1111
foreign key(writer) references members(id)
on delete set null;

insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '����', 'hong', '����ִ� ��');

-- �������� ���� ( member ���̺� ���� writer�� insert ���� �ʴ´�.)
insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '����', 'kang', '����ִ� ��_hong');

insert into boards(no, subject, writer, content)
values(SEQTEST.nextval, '�ٴ�', 'kim', '����ִ� ��_kim');

commit;

select * from boards;

-- ��ȸ����
select * 
from ���̺�
where ������
[group by �׷���]
[having �׷���������]
[order by ����];

select name, hiredate
from members;

--alias 
select 
name as "�̸�",
12 * salary as "����"
from members;

select * from members
where id='hong' or id='kim';

select * from members where name like '%��';

select * from members where name like '��%';

select * from members where name like '%a%';

select * from members 
where salary >= 1000 and salary <=2500;

select * from members
where salary between 1000 and 2500;

--select�� commit�� �ʿ����
--insert, update, delete�� commit�� �ؾ��ϰ�
-- create�� alter���� commit�̶� ���� ������ ����.

-- null : �� �Ǵ��� �Ұ����� �� �� ���� ��
select * from members 
--�̷��� �ϸ� ���� "����" ���� �ǰ�
where salary is null;

select * from members
--�̷��� �ϸ� "�񱳸� �� �� ����" ���� ��.
where salary = null;

-- ������
-- not in, not like, not between, is not null

-- ����
-- asc(�⺻) : ��������
-- desc : ��������
-- desc ���̺� : ���̺� ���� ���� ����
desc members;

select * from members 
order by hiredate desc;

select * from members 
order by name desc;

select * from members 
order by name asc;

-- �޿��� ���� ������ �����ϵ� �̸��� �������� ����
select * from members
order by salary asc, name desc;

-- �׷��Լ� : min, max, avg, sum, count 
-- HAVING �� : �׷��Լ� �÷��� ���� �������� �ְ� ���� �� ���
select max(salary)
from members;

-- ���� ����
-- �ִ� �޿��� �޴� ���� ���̵�� �̸���?
select id,name from members
where salary = (
    select max(salary)
    from members
);

--��� �޿����� ���� �޴� ����� �̸�?
select name from members
where salary < (
    select avg(salary)
    from members
);

-- ������ ��������
--�Խù��� ������ �ʴ� ����� �̸�?
select name from members
where id not in (
    select distinct(writer) from boards
);
--�θ� : ��Ʈ��Ʈ�� ������
--(https://nuli.navercorp.com/sharing/ui/patternPaginate/6)

-- JOIN ( 2�� �̻��� ���̺��� ���ļ� ��ȸ�ϱ� ) 
-- �Խù��� ���� ����� �̸��� �޿� ��ȸ
select * from members;
select * from boards;

select * from members
left join boards
on members.id = boards.writer;

select m.name, m.salary, b.subject, b.content
from members m join boards b
on m.id = b.writer;


-- �Խù� �ۼ��� id�� �ۼ� �Ǽ��� ��ȸ�ϼ���.
select writer, count(*)
from boards
group by writer