insert into TBL_BOARD(bno, title, content, writer)
    (select SEQ_BOARD.NEXTVAL, title, content, writer from TBL_BOARD);
    
    commit;
    
select * from TBL_BOARD order by bno +1 desc;    
select * from TBL_BOARD where bno >0;

--검색
select * from TBL_BOARD
where content like '%금요일%';

--검색
select * from (
    select rownum rn, title, content, writer, regdate, updatedate
    from TBL_BOARD
    where (content like '%금요일%' or title like '%title%')
    and rownum <= 20
)
where rn > 10;

--검색
select * from TBL_BOARD;



--실행계획. 인덱스
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
