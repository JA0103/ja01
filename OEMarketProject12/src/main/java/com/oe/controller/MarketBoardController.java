package com.oe.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oe.config.StringToDate;
import com.oe.domain.FileUploadVO;
import com.oe.domain.MarketBoardVO;
import com.oe.service.MarketBoardService;

import lombok.extern.log4j.Log4j;

@Controller
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@WebAppConfiguration
@Log4j
@RequestMapping("/board/*")
public class MarketBoardController {

   @Autowired
   private MarketBoardService service;

// boardInsert.jsp로 이동하는 매핑
   @GetMapping("boardInsert")
   public String boardInsert(Model model) {
      
      return "board/boardInsert";
   }
   
   // boardInsert.jsp에서 boardList.jsp로 이동 / 파일 다중 업로드
   @PostMapping("boardRegister.do")
   public String requestupload2(MultipartHttpServletRequest mtfRequest) {
       
        List<MultipartFile> fileList = mtfRequest.getFiles("bo_image");

        String path = "C:\\oe_Upload\\";
      
        String bo_id = mtfRequest.getParameter("bo_id");
        String bo_title = mtfRequest.getParameter("bo_title");
        String bo_nickname = mtfRequest.getParameter("bo_nickname");
        String bo_price = mtfRequest.getParameter("bo_price");
        String bo_content = mtfRequest.getParameter("bo_content");
        String bo_count = mtfRequest.getParameter("bo_count");
        String bo_heart = mtfRequest.getParameter("bo_heart");
        String bo_heartcount = mtfRequest.getParameter("bo_heartcount");
        String bo_category = mtfRequest.getParameter("bo_category");
        String bo_address1 = mtfRequest.getParameter("bo_address1");
        String bo_address2 = mtfRequest.getParameter("bo_address2");
        
        
        MarketBoardVO vo = new MarketBoardVO();
        vo.setBo_id(bo_id);
        vo.setBo_title(bo_title);
        vo.setBo_nickname(bo_nickname);
        vo.setBo_price(Long.parseLong(bo_price));
        vo.setBo_content(bo_content);
//        vo.setBo_count(Long.parseLong(bo_count));
//        vo.setBo_heart(Long.parseLong(bo_heart));
//        vo.setBo_heartcount(Long.parseLong(bo_heartcount));
        vo.setBo_category(bo_category);
        
        vo.setBo_address1(bo_address1);
        vo.setBo_address2(bo_address2);
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            
            vo.setBo_image(originFileName);  // 파일 이름만 나오게
        }
        
        service.register(vo);
        
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
            FileUploadVO fvo = new FileUploadVO();
            fvo.setFile_original(originFileName);
            fvo.setFile_size(fileSize);
            service.fileUpload(fvo);
        
         }
        
           return "redirect:/board/boardListOrderByHeart";

   }
   
   /* 정렬 파트 */
   @GetMapping("/boardListOrderByHeart")
   public String list(Model model) {
      
      model.addAttribute("mb_list", service.boardListOrderByHeart());
      
      return "board/boardList";
      
   }
   
   @GetMapping("/boardListOrderByRegdate")
   public String boardListOrderByRegdate(Model model, @RequestParam String align) {
      
     String result = align;
     
     model.addAttribute("result", result);
      
      model.addAttribute("mb_list", service.boardListOrderByRegdate());
      
      return "board/boardList";
      
   }
  
   @GetMapping("/boardListOrderByLowPrice")
   public String boardListOrderByLowPrice(Model model, @RequestParam String align) {
      
     String result = align;
        
     model.addAttribute("result", result);
      
      model.addAttribute("mb_list", service.boardListOrderByLowPrice());
      
      return "board/boardList";
      
   }
   
   @GetMapping("/boardListOrderByHighPrice")
   public String boardListOrderByHighPrice(Model model, @RequestParam String align) {
      
     String result = align;
        
     model.addAttribute("result", result);
      
      
      model.addAttribute("mb_list", service.boardListOrderByHighPrice());
      
      return "board/boardList";
      
   }
   
// boardIDetail.jsp로 이동하는 매핑
   @GetMapping("/boardDetail")
   public String boardInsert(Model model,@RequestParam Long bo_num) {
      System.out.println(bo_num);
      
      model.addAttribute("mb_list", service.boardDetail(bo_num));
      model.addAttribute("file_list", service.boardFile(bo_num));

      return "board/boardDetail";
      
   }
   
}