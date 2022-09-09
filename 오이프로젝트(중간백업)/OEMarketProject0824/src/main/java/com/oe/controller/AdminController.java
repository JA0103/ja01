package com.oe.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oe.domain.MarketUserVO;
import com.oe.service.AdminService;
import com.oe.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminController {

//    @Autowired
   private AdminService service;
   private MyPageService MPservice;
   
   
   
   @GetMapping("adminMode")
   public String adminMode(Model model) {
	   log.info("============admin mode========");

	   model.addAttribute("ad_user", service.adminUserList());
	   model.addAttribute("ad_board", service.adminBoardList());
      return "redirect:/admin";
   }
   
   @GetMapping("adminUser")
   public String adminUser(Model model ) {
	   log.info("============admin user========");
	   List<MarketUserVO> user_id = service.adminUserId();
	   model.addAttribute("ad_user", service.adminUserList());
	   return "/admin/userManage";
   }

   @GetMapping("adminBoard")
   public String adminBoard(Model model) {
	   log.info("============admin board========");
	   
	   model.addAttribute("ad_board", service.adminBoardList());
      return "/admin/boardManage";
   }


   @GetMapping("adminManage")
   public String adminNotice(Model model) {
	   log.info("============admin========");
	   
      return "/admin/adminManage";
   }

   
   
   
}