package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.DataSourceTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
//		mapper.getList().forEach(board->log.info(board));
		for(BoardVO vo : mapper.getList()) {
			log.info(vo);
		}
	}
	
	@Test
	public void testinsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("Sujung의 정석");
		vo.setContent("So Bad");
		vo.setWriter("리수정");
		mapper.insert(vo);
	}
	
	@Test
	public void testSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("냠");
		vo.setContent("So Good");
		vo.setWriter("지나");
		mapper.insertSelectKey(vo);
	}
	
	@Test
	public void testRead() {
		BoardVO vo = mapper.read(16L);
	}

    @Test
    public void testdelete() {
//	 mapper.delete(9L);
     log.info("delete count : "+mapper.delete(9L));
    }
	
    @Test
    public void testupdate() {
    	BoardVO vo = new BoardVO();
    	vo.setBno(14L);
    	vo.setTitle("오라클제목");
    	vo.setContent("오라클내용");
    	vo.setWriter("오라클");
    	log.info("update: " + mapper.update(vo));
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}//
