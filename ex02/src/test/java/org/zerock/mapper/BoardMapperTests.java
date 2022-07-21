package org.zerock.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
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
		log.info(mapper.getList());
	}
	
	@Test
	public void testRead() {
		log.info(mapper.read(1L));
	}
	
	@Test
	public void testDelete() {
		log.info("delete : "+mapper.delete(1L));
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("title1");
		vo.setContent("content");
		vo.setWriter("writer");
		
		log.info("insert : " + mapper.insert(vo));
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("title5");
		vo.setContent("content");
		vo.setWriter("writer");
		
		log.info("insert : " + mapper.insertSelectKey(vo));
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(3L);
		vo.setTitle("수정");
		vo.setContent("수정수정");
		vo.setWriter("이수정");
		
		log.info("insert : " + mapper.update(vo));
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<BoardVO> list = mapper.getListWithPagging(cri);
		log.info(list);
	}
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		cri.setPageNum(15);
		cri.setAmount(10);
		PageDTO pageDTO = new PageDTO(cri, 315);
		log.info(pageDTO);
	}
	
	
	@Test
	public void testSearchTest() {
		Map<String, String> map = new HashMap<>();
		map.put("T", "오늘은");
		map.put("C", "content");
		map.put("W", "김진아");
		
		Map<String, Map<String, String>> outer = new HashMap<>();
		
		outer.put("map", map);
		List<BoardVO> list = mapper.searchTest(outer);
		log.info(list);
	}
	
	
	@Test
	public void testSearchPaging() {
		Criteria cri = new Criteria();
		cri.setType("T");
		cri.setKeyword("돈가");
		
		List<BoardVO> list = mapper.getListWithPagging(cri);
		log.info(list);
	}
	
	@Test
	public void testTotal() {
		Criteria cri = new Criteria();
		cri.setType("T");
		cri.setKeyword("돈가");
		
		int count = mapper.getTotalCount(cri);
		
		log.info("--------------------------------------------------");
		log.info("count : "+count);
	}
	
	
}//
