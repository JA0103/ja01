create table board(
    id number(5) PRIMARY KEY,
    name VARCHAR(20),
    phone VARCHAR2(20),
    address VARCHAR2(50)
    
);

insert into board values(1, 'ȫ�浿', '010-1111-2222', '����� ������');
insert into board values(2, 'ȫ�浿2', '010-1111-2222', '����� ������');
insert into board values(3, 'ȫ�浿3', '010-1111-2222', '����� ������');
insert into board values(4, 'ȫ�浿4', '010-1111-2222', '����� ������');
insert into board values(5, 'ȫ�浿5', '010-1111-2222', '����� ������');




commit;

select * from BOARD;