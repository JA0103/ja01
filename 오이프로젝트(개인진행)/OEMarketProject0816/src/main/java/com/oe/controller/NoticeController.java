package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oe.domain.Criteria_center;
import com.oe.domain.PageDTO_center;
import com.oe.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/center/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;
	
	@GetMapping({"/center", "/FAQ"})
	public void getListCenter(String us_id, /* @ModelAttribute("cri") Criteria_center cri, */Model model) {
//		int totalFAQ = service.getTotalFAQ(cri);
		
		log.info("center or FAQ");
		
		model.addAttribute("listCenter", service.getListCenter());
		model.addAttribute("noticeCenter", service.getNoticeCenter());
//		model.addAttribute("listFAQ", service.getListFAQ(cri));
//		model.addAttribute("pageMaker", new PageDTO_center(cri, totalFAQ));
		
		if(us_id != null) {
			log.info("us_id : " + us_id);
			log.info("us_grade : " + service.getUserGrade(us_id));
			model.addAttribute("us_id", us_id);
			model.addAttribute("us_grade", service.getUserGrade(us_id));
		}
	}
	
	@GetMapping("QnAInsert")
	public void QnAInsert() {}
	
	@GetMapping("suggestInsert")
	public void suggestInsert() {}
	
	
	
}//
