package com.oe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oe.domain.CriteriaVO;
import com.oe.domain.FileUploadVO;
import com.oe.domain.MarketBoardVO;
import com.oe.domain.PageDTO;
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
   @PostMapping("boardRegister")
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
   
   @GetMapping("/boardListOrderByHeart")
   public String boardListOrderByHeart(Model model, CriteriaVO cri) {
	   
	   
	   int total = service.getTotal(cri);
	   
	   model.addAttribute("mb_list", service.boardListOrderByHeart(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   log.info("total : " + total);
	   
       return "board/boardList";
      
   }
   
   @GetMapping("/boardListOrderByRegdate")
   public String boardListOrderByRegdate(Model model, @RequestParam String align, CriteriaVO cri) {
      
     String order = align;
     
     model.addAttribute("order", order);
     model.addAttribute("mb_list", service.boardListOrderByRegdate(cri));
     int total = service.getTotal(cri);
     model.addAttribute("pageMaker",new PageDTO(cri, total));
      
      return "board/boardList";
      
   }
  
   @GetMapping("/boardListOrderByLowPrice")
   public String boardListOrderByLowPrice(Model model, @RequestParam String align, CriteriaVO cri) {
      
     String order = align;
        
     model.addAttribute("order", order);
      
     int total = service.getTotal(cri);
      model.addAttribute("mb_list", service.boardListOrderByLowPrice(cri));
      model.addAttribute("pageMaker",new PageDTO(cri, total));
      
      return "board/boardList";
      
   }
   
   @GetMapping("/boardListOrderByHighPrice")
   public String boardListOrderByHighPrice(Model model, @RequestParam String align,CriteriaVO cri) {
      
     String order = align;
        
     model.addAttribute("order", order);
      
      
     int total = service.getTotal(cri);
      model.addAttribute("mb_list", service.boardListOrderByHighPrice(cri));
      model.addAttribute("pageMaker",new PageDTO(cri, total));
      
      return "board/boardList";
      
   }
   
   
// boardIDetail.jsp로 이동하는 매핑
   @GetMapping("/boardDetail")
   public String boardDetail(@RequestParam String align, Model model,@RequestParam Long bo_num, @ModelAttribute("cri") CriteriaVO cri) {
	  
	  String order = align;
       
	  model.addAttribute("order", order);
	   
      model.addAttribute("mb_list", service.boardDetail(bo_num));
      model.addAttribute("file_list", service.boardFile(bo_num));
      
      
      return "board/boardDetail";
      
   }
   
   //boardUpdate.jsp로 이동하는 컨트롤러
   @GetMapping("/boardUpdateForm")
   public String boardUpdateForm(Model model,@RequestParam Long bo_num, @ModelAttribute("cri")CriteriaVO cri, RedirectAttributes rttr, @RequestParam String align) {
	   
	  String order = align;
      
	  model.addAttribute("order", order);
      model.addAttribute("mb_list", service.boardDetail(bo_num));
      model.addAttribute("file_list", service.boardFile(bo_num));
      
      rttr.addAttribute("pageNum", cri.getPageNum());
	  rttr.addAttribute("amount", cri.getAmount());
	  rttr.addAttribute("type", cri.getType());
	  rttr.addAttribute("keyword", cri.getKeyword());
	  
      
      return "board/boardUpdate";
      
   }
   
   //boardUpdate.jsp에서 수정한 정보 DB에 저장
   @PostMapping("/boardUpdate")
   public String requestupload1(MultipartHttpServletRequest mtfRequest, Model model, 
		   @RequestParam Long bo_num, @ModelAttribute("cri")CriteriaVO cri, RedirectAttributes rttr, @RequestParam String align) {
       
       System.out.println("bo_num ============== " + bo_num);
       
        
        MarketBoardVO vo = new MarketBoardVO();
        vo.setBo_id(mtfRequest.getParameter("bo_id"));
        vo.setBo_title(mtfRequest.getParameter("bo_title"));
        vo.setBo_nickname(mtfRequest.getParameter("bo_nickname"));
        vo.setBo_price(Long.parseLong(mtfRequest.getParameter("bo_price")));
        vo.setBo_content(mtfRequest.getParameter("bo_content"));
        vo.setBo_category(mtfRequest.getParameter("bo_category"));
        vo.setBo_address1(mtfRequest.getParameter("bo_address1"));
        vo.setBo_address2(mtfRequest.getParameter("bo_address2"));
        vo.setBo_num(bo_num);
        
        if(service.boardUpdate(vo)==1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addAttribute("align", align);
		
		if(align.equals("lowPrice")) {
			return "redirect:/board/boardListOrderByLowPrice";
		}
		if(align.equals("regdate")) {
			return "redirect:/board/boardListOrderByRegdate";
		}
		if(align.equals("highPrice")) {
			return "redirect:/board/boardListOrderByHighPrice";
		}else {
			return "redirect:/board/boardListOrderByHeart";
		}
   }
   
   @PostMapping("/boardDelete")
   public String boardDelete(@RequestParam Long bo_num, @ModelAttribute("cri")CriteriaVO cri, RedirectAttributes rttr, @RequestParam String align) {
	   
	   	if(service.boardDelete(bo_num)==1) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
	     
		rttr.addAttribute("align", align);
		
		if(align.equals("lowPrice")) {
			return "redirect:/board/boardListOrderByLowPrice";
		}
		if(align.equals("regdate")) {
			return "redirect:/board/boardListOrderByRegdate";
		}
		if(align.equals("highPrice")) {
			return "redirect:/board/boardListOrderByHighPrice";
		}else {
			return "redirect:/board/boardListOrderByHeart";
		}
		
		
      
   }
   
   
   // 0815 카테고리 정렬
   @GetMapping("/categoryBook")
   public String categoryBook(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryBook(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryMusic")
   public String categoryMusic(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryMusic(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   log.info("total : "+ total);
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryArt")
   public String categoryArt(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryArt(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryWoman")
   public String categoryWoman(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryWoman(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryMan")
   public String categoryMan(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryMan(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryShoes")
   public String categoryShoes(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryShoes(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryBag")
   public String categoryBag(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryBag(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryWatch")
   public String categoryWatch(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryWatch(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryJewelry")
   public String categoryJewelry(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryJewelry(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryFuniture")
   public String categoryFuniture(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryFuniture(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryCar")
   public String categoryCar(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryCar(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryKidult")
   public String categoryKidult(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryKidult(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryFood")
   public String categoryFood(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryFood(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryPet")
   public String categoryPet(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryPet(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   @GetMapping("/categoryEtc")
   public String categoryEtc(Model model, @RequestParam String align, CriteriaVO cri) {
      
	   String order = align;
	   model.addAttribute("order", order);
	   
	   int total = service.getTotal(cri);
	   model.addAttribute("mb_list", service.categoryEtc(cri));
	   model.addAttribute("pageMaker",new PageDTO(cri, total));
	   
	   if(total == 0) {
		   model.addAttribute("msg", "검색 결과가 없습니다.");
		   model.addAttribute("url", "/board/boardListOrderByHeart");
		   return "board/boardAlert";
	   }else {
		   return "board/boardList";		   
	   }
   }
   
   
   
   
   
   
   
   
   
   
   
}