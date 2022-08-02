
insert into TBL_BOARD(bno, title, content, writer)
    (select SEQ_BOARD.NEXTVAL, title, content, writer from TBL_BOARD);
    
    commit;
    
select * from TBL_BOARD order by bno +1 desc;    
select * from TBL_BOARD where bno >0;

--�˻�
select * from TBL_BOARD
where content like '%�ݿ���%';

--�˻�
select * from (
    select rownum rn, title, content, writer, regdate, updatedate
    from TBL_BOARD
    where (content like '%�ݿ���%' or title like '%title%')
    and rownum <= 20
)
where rn > 10;

--�˻�
select * from (
    select /*+ index_desc(tbl_board pk_board) */
    rownum rn, title, content, writer, regdate, updatedate
    from TBL_BOARD
    where (title like '%������%' or content like '%����%') and rownum <= 20
    )
where rn >10;  

select * from TBL_BOARD where title like '%����%' or content like '%����%';





--�����ȹ. �ε���
select /* + index_desc(tbl_board pk_board)  */ 
rownum rs, bno, title, writer
from tbl_board 
where rownum <=20;

select bno, title, writer
from (
        select /* + index_desc(tbl_board pk_board)  */ 
        rownum rs, bno, title, writer
        from tbl_board 
        where rownum <=20
)
where rs > 10;



create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2 (1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate
);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key (bno) references tbl_board(bno);

desc tbl_reply;

select * from tbl_board;
select * from tbl_reply;
select * from tbl_reply where rno = 329 ;
commit;




































