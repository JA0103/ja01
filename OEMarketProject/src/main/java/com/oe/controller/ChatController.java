package com.oe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.service.ChatRoomService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class ChatController {

//	@RequestMapping("/chat")
//	public ModelAndView chat() {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("chat");
//		return mv;
//	}
	
	private ChatRoomService service;
	
	
	@PostMapping("/room")
	public String getRoom(String us_nickname, RedirectAttributes rttr) {
		
		if(service.checkRoom(us_nickname) == null) {
			service.register(us_nickname);
			return "redirect:/chat";
		}else {
			return "redirect:/chat";
		}
		
		
	}
	
	@GetMapping("/chat")
	public void chat( ) {
	}
}
