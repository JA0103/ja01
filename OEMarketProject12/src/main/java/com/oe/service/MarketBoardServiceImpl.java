package com.oe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oe.domain.FileUploadVO;
import com.oe.domain.MarketBoardVO;
import com.oe.mapper.MarketBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MarketBoardServiceImpl implements MarketBoardService {
   
   @Autowired
   private MarketBoardMapper boardMapper;

   @Override
   public void crawlingDelete() {
      boardMapper.crawlingRemove();
   }

   /*-- 새로운 상품 등록 --*/

   @Override
   public void register(MarketBoardVO vo) {
      boardMapper.insert(vo);
   }

   @Override
   public MarketBoardVO get(Long bo_num) {
      return null;
   }

   @Override
   public int modify(MarketBoardVO vo) {
      return 0;
   }

   @Override
   public int remove(Long bo_num) {
      return 0;
   }

   @Override
   public void fileUpload(FileUploadVO fvo) {
      boardMapper.insertFile(fvo);
   }

   @Override
   public List<MarketBoardVO> boardListOrderByHeart() {
	   return boardMapper.getListBoard();
   }
   
   @Override
   public List<MarketBoardVO> boardListOrderByRegdate() {
      return boardMapper.getList_regdate();
   }

   @Override
   public List<MarketBoardVO> boardListOrderByLowPrice() {
      return boardMapper.getList_lowPrice();
   }

   @Override
   public List<MarketBoardVO> boardListOrderByHighPrice() {
      return boardMapper.getList_highPrice();
   }
   
   
   @Override
   public MarketBoardVO boardDetail(Long bo_num) {
      return boardMapper.getBoardDetail(bo_num);
   }
   
   // boardDetail 사진 가져오기
   @Override
   public List<FileUploadVO> boardFile(Long bo_num) {
      return boardMapper.getBoardFile(bo_num);
   }
   

}