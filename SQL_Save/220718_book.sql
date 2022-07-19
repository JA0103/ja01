insert into TBL_BOARD(bno, title, content, writer)
    (select SEQ_BOARD.NEXTVAL, title, content, writer from TBL_BOARD);
    
    commit;
    
select * from TBL_BOARD order by bno +1 desc;    
select * from TBL_BOARD;

--Ω««‡∞Ë»π. ¿Œµ¶Ω∫
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
