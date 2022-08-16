package com.oe.service;

import java.util.List;

import com.oe.domain.FileUploadVO;
import com.oe.domain.MarketBoardVO;

public interface MarketBoardService {
   
   public void crawlingDelete();
   
   public void register(MarketBoardVO vo);
   public MarketBoardVO get(Long bo_num);
   public int modify(MarketBoardVO vo);
   public int remove(Long bo_num);
   public void fileUpload(FileUploadVO fvo);
   
   public List<MarketBoardVO> boardListOrderByHeart();
   public List<MarketBoardVO> boardListOrderByRegdate();
   public List<MarketBoardVO> boardListOrderByLowPrice();
   public List<MarketBoardVO> boardListOrderByHighPrice();
   
   public MarketBoardVO boardDetail(Long bo_num);
   
   // boardDetail 사진 가져오기
   public List<FileUploadVO> boardFile(Long bo_num);
    
}