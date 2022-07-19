package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.persistence.DataSourceTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@WebAppConfiguration
@Log4j
public class BoardControllerTests {
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void testRegister() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
						.param("title", "자두스무디")
						.param("content", "맛있다")
						.param("writer", "3900원")
						)
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
	
	@Test
	public void testGet() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
						.param("bno", "15")
						)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	@Test
	public void testRemove() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
						.param("bno", "15")
						)
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
	
	@Test
	public void testUpdate() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/update")
						.param("bno", "14")
						.param("title", "오늘은")
						.param("content", "금요일")
						.param("writer", "신난당")
						)
				.andReturn()
				.getModelAndView()
				.getViewName()
				);
	}
	
	@Test
	public void testListPaging() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
						.param("pageNum", "5")
						.param("amount", "30")
						)
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
	}
	
	
	
	
	
}//
