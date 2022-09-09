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
	
	@GetMapping("/center")
	public void getListCenter(String us_id, Model model) {
		log.info("center");
		
		model.addAttribute("listCenter", service.getListCenter());
		model.addAttribute("noticeCenter", service.getNoticeCenter());
		
		if(us_id != null) {
			log.info("us_id : " + us_id);
			log.info("us_grade : " + service.getUserGrade(us_id));
			model.addAttribute("us_id", us_id);
			model.addAttribute("us_grade", service.getUserGrade(us_id));
		}
	}
	
	@GetMapping("/notice")
	public void getListNotice(String us_id, @ModelAttribute("cri") Criteria_center cri, Model model) {
		int totalNotice = service.getTotalNotice();
		
		log.info("Notice");
		log.info("cri : " + cri);
		log.info("totalNotice : " + totalNotice);
		
		model.addAttribute("listNotice", service.getListNotice(cri));
		model.addAttribute("pageMaker", new PageDTO_center(cri, totalNotice));
		
		if(us_id != null) {
			log.info("us_id : " + us_id);
			log.info("us_grade : " + service.getUserGrade(us_id));
			model.addAttribute("us_id", us_id);
			model.addAttribute("us_grade", service.getUserGrade(us_id));
		}
	}
	
	@GetMapping("/FAQ")
	public void getListCenter(String us_id, @ModelAttribute("cri") Criteria_center cri, Model model) {
		int totalFAQ = service.getTotalFAQ(cri);
		
		log.info("FAQ");
		log.info("cri : " + cri);
		log.info("totalFAQ : " + totalFAQ);
		
		model.addAttribute("listFAQ", service.getListFAQ(cri));
		model.addAttribute("pageMaker", new PageDTO_center(cri, totalFAQ));
		
		if(us_id != null) {
			log.info("us_id : " + us_id);
			log.info("us_grade : " + service.getUserGrade(us_id));
			model.addAttribute("us_id", us_id);
			model.addAttribute("us_grade", service.getUserGrade(us_id));
		}
	}
	
	@GetMapping({"/noticeDetails", "/FAQDetails"})
	public void getNotice(String us_id, Integer no_num, Model model) {
		log.info("noticeDetails or FAQDetails");
		log.info("no_num : " + no_num);
		model.addAttribute("notice", service.getNotice(no_num));
	}
	
	@GetMapping({"/noticeInsert", "/FAQInsert"})
	public void register() {}
}
