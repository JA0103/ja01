create table board(
    num number(5) PRIMARY KEY,
    pass VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    title VARCHAR2(50),
    content VARCHAR2(1000),
    readcount number(4) DEFAULT 0,
    writedate date DEFAULT sysdate
);

create SEQUENCE board_seq start with 1 INCREMENT by 1;

insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '������', 'pinksung@nate.com', '1234', 'ù�湮', '�ݰ����ϴ�.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '������', 'pinksung@nate.com', '1234', '���', '���־��.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '������', 'raccon@nate.com', '1234', '����', '�Ͻ��Դϴ�.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '������', 'one@nate.com', '1234', '������', '���������� ���ֽ��ϴ�.');

select * from BOARD;

commit;