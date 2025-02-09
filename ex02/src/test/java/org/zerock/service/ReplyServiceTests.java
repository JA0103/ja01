package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	@Autowired
	private ReplyService service;
	
	@Test
	public void test() {
		log.info(service);
	}
	
	@Test
	public void TestRegister() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(17L);
		vo.setReply("test1");
		vo.setReplyer("tester1");
		service.register(vo);
	}
	
	@Test
	public void testRemove() {
		service.remove(11L);
	}
	
	
	
}//
