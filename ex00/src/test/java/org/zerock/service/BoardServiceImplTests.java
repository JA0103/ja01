package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.TimeMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceImplTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testregister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("날씨2");
		vo.setContent("내용");
		vo.setWriter("날파리");
		service.register(vo);
	}
	
	@Test
	public void testmodify() {
		BoardVO vo = new BoardVO();
		vo.setBno(7L);
		vo.setTitle("날파리");
		vo.setContent("진짜");
		vo.setWriter("짜증나");
		service.modify(vo);
	}
	
	@Test
	public void testremove() {
		service.remove(9L);
	}
	
	@Test
	public void testget() {
		service.get(5L);
	}
	
	@Test
	public void testgetList() {
		service.getList();
	}
	
	
	
}
