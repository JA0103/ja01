package com.oe.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.CenterVO;
import com.oe.domain.Criteria_suggest;
import com.oe.domain.PageDTO_suggest;
import com.oe.service.CenterService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/center/*")
@AllArgsConstructor
public class CenterController {
	private CenterService service;
	

	@GetMapping("/QnAInsert")
	public void QnAInsert() {}

	@PostMapping("/QnAInsert")
	public String QnAInsert(MultipartHttpServletRequest mtfRequest, RedirectAttributes rttr) {
		log.info("QnAInsert======================");
		
		
		
		String ce_id = mtfRequest.getParameter("ce_id");
		String ce_nickname = mtfRequest.getParameter("ce_nickname");
		String ce_email = mtfRequest.getParameter("ce_email");
		String ce_title = mtfRequest.getParameter("ce_title");
		String ce_content = mtfRequest.getParameter("ce_content");
		String ce_category = mtfRequest.getParameter("ce_category");
		String ce_status = mtfRequest.getParameter("ce_status");
		
		MultipartFile ce_file = mtfRequest.getFile("ce_filename"); 
		
		String ce_filename = ce_file.getOriginalFilename();
		long ce_filesize = ce_file.getSize();
		String ce_filepath = "C:\\oe_Upload\\";
		
		String safeFile = ce_filepath + ce_filename;
		
		try {
			ce_file.transferTo(new File(safeFile));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		CenterVO vo = new CenterVO();
		vo.setCe_id(ce_id);
		vo.setCe_nickname(ce_nickname);
		vo.setCe_email(ce_email);
		vo.setCe_title(ce_title);
		vo.setCe_content(ce_content);
		vo.setCe_category(ce_category);
		vo.setCe_status(ce_status);
		vo.setCe_filename(ce_filename);
		vo.setCe_filesize(ce_filesize);
		vo.setCe_filepath(ce_filepath);
		log.info("vo========================="+vo);
		service.QnAInstert(vo);
		rttr.addAttribute("us_id",ce_id);
		return "redirect:/center/QnA";
	}
	
	@GetMapping("/QnA")
	public void getQnAList(String us_id, Model model) {
		log.info("us_id========================= : "+us_id);
		log.info("getQnAList========================= : "+service.getQnAList(us_id));
		model.addAttribute("QnAList",service.getQnAList(us_id));
	}
	
	
	@GetMapping("/QnADetails")
	public void getQnA(String ce_num, Model model) {
		log.info("us_id========================= : "+ce_num);
		log.info("getQnA========================= : "+service.getQnA(ce_num));
		model.addAttribute("QnA",service.getQnA(ce_num));
	}
	
	
	@GetMapping("/suggestInsert")
	public void suggestInsert() {}
	
	
	@PostMapping("/SuggestInsert")
	public String SuggestInsert(MultipartHttpServletRequest mtfRequest, RedirectAttributes rttr) {
		log.info("SuggestInsert======================");
		
		String ce_id = mtfRequest.getParameter("ce_id");
		String ce_nickname = mtfRequest.getParameter("ce_nickname");
		String ce_title = mtfRequest.getParameter("ce_title");
		String ce_content = mtfRequest.getParameter("ce_content");
		String ce_category = mtfRequest.getParameter("ce_category");
		
		MultipartFile ce_file = mtfRequest.getFile("ce_filename"); 
		
		String ce_filename = ce_file.getOriginalFilename();
		long ce_filesize = ce_file.getSize();
		String ce_filepath = "C:\\oe_Upload\\";
		
		String safeFile = ce_filepath + ce_filename;
		
		try {
			ce_file.transferTo(new File(safeFile));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		CenterVO vo = new CenterVO();
		vo.setCe_id(ce_id);
		vo.setCe_nickname(ce_nickname);
		vo.setCe_title(ce_title);
		vo.setCe_content(ce_content);
		vo.setCe_category(ce_category);
		vo.setCe_filename(ce_filename);
		vo.setCe_filesize(ce_filesize);
		vo.setCe_filepath(ce_filepath);
		log.info("vo========================="+vo);
		service.SuggestInstert(vo);
		rttr.addAttribute("us_id",ce_id);
		return "redirect:/center/suggest";
	}
	
	
	 @GetMapping("suggest")
	   public void getListWithPaging(Model model,Criteria_suggest cri,String us_id) {
		 if(us_id == null) {
			 us_id="";
		 }
		 if(cri.getCategory()==null) {
			 cri.setCategory("");
		 }
		 
		 log.info("suggest====================cri : " + cri);
	      log.info("suggest====================us_id : " + us_id);
	      int total = service.getSuggestTotal(us_id);
	      log.info("======================total : "+total);
	      log.info("======================List : "+service.getSuggestListWithPaging(cri,us_id));
	      model.addAttribute("suggest", service.getSuggestListWithPaging(cri,us_id));
	      model.addAttribute("pageMaker", new PageDTO_suggest(cri, total));
	   }
	
	
	
	
	
	
	
}//
