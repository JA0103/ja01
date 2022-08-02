package org.zerock.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


/* 작업		(Url)	  (Http전송방식)
 * 등록 : /replies/new : Post
 * 조회 : /replies/:rno : Get
 * 삭제 : /replies/:rno : Delete
 * 수정 : /replies/:rno : Put ot Patch
 * 페이지 : /replies/pages/:bno/:page : Get
 */




@RestController
@RequestMapping("/replies/")
@Log4j
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	
	
}
