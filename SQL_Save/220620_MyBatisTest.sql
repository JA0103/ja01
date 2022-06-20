create table board(
    id number(5) PRIMARY KEY,
    name VARCHAR(20),
    phone VARCHAR2(20),
    address VARCHAR2(50)
    
);

insert into board values(1, '홍길동', '010-1111-2222', '서울시 강남구');
insert into board values(2, '홍길동2', '010-1111-2222', '서울시 강남구');
insert into board values(3, '홍길동3', '010-1111-2222', '서울시 강남구');
insert into board values(4, '홍길동4', '010-1111-2222', '서울시 강남구');
insert into board values(5, '홍길동5', '010-1111-2222', '서울시 강남구');




commit;

select * from BOARD;