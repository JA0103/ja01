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
values(board_seq.nextval, '¼ºÀ±Á¤', 'pinksung@nate.com', '1234', 'Ã¹¹æ¹®', '¹İ°©½À´Ï´Ù.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, '¼ºÀ±Á¤', 'pinksung@nate.com', '1234', '±è¹ä', '¸ÀÀÖ¾î¿ä.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, 'Àü¼öºó', 'raccon@nate.com', '1234', '°íµî¾Ö', 'ÀÏ½ÄÀÔ´Ï´Ù.');
insert into BOARD(num, name, email, pass, title, content)
values(board_seq.nextval, 'Àü¿øÁö', 'one@nate.com', '1234', '°¹°ñ¸¶À»', 'µÅÁö»ï°ã»ìÀÌ ¸ÀÀÖ½À´Ï´Ù.');

select * from BOARD;

commit;