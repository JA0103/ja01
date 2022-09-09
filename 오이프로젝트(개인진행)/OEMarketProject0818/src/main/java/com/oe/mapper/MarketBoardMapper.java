package com.oe.mapper;

import java.util.List;
import java.util.Map;

import com.oe.domain.CriteriaVO;
import com.oe.domain.FileUploadVO;
import com.oe.domain.MarketBoardVO;

public interface MarketBoardMapper {
   
   public MarketBoardVO read(Long bo_num);
   public int insert(MarketBoardVO vo);
   public void insertFile(FileUploadVO fvo);

   // 상품 정렬 버튼 및 페이징 처리
   public List<MarketBoardVO> getListBoard(CriteriaVO cri);
   public List<MarketBoardVO> getList_regdate(CriteriaVO cri);
   public List<MarketBoardVO> getList_lowPrice(CriteriaVO cri);
   public List<MarketBoardVO> getList_highPrice(CriteriaVO cri);
   
   public int getTotalCount(CriteriaVO cri);
   
   // BoardDetail
   public MarketBoardVO getBoardDetail(Long bo_num);
   public int updateBoard(MarketBoardVO vo);
   public int removeBoard(Long bo_num);
   public List<FileUploadVO> getBoardFile(Long bo_num);
   
   //검색
   public List<MarketBoardVO> searchTest(Map<String, Map<String,String>> map);

   // 크롤링
   public void crawlingRemove();
   public void crawlinginsert(MarketBoardVO vo);
   
   // 추후
   public void updateBoardFile(FileUploadVO fvo);
   
   // 0815 카테고리 정렬
   public List<MarketBoardVO> getList_book(CriteriaVO cri);
   public List<MarketBoardVO> getList_music(CriteriaVO cri);
   public List<MarketBoardVO> getList_art(CriteriaVO cri);
   public List<MarketBoardVO> getList_woman(CriteriaVO cri);
   public List<MarketBoardVO> getList_man(CriteriaVO cri);
   public List<MarketBoardVO> getList_shoes(CriteriaVO cri);
   public List<MarketBoardVO> getList_bag(CriteriaVO cri);
   public List<MarketBoardVO> getList_watch(CriteriaVO cri);
   public List<MarketBoardVO> getList_jewelry(CriteriaVO cri);
   public List<MarketBoardVO> getList_funiture(CriteriaVO cri);
   public List<MarketBoardVO> getList_car(CriteriaVO cri);
   public List<MarketBoardVO> getList_kidult(CriteriaVO cri);
   public List<MarketBoardVO> getList_food(CriteriaVO cri);
   public List<MarketBoardVO> getList_pet(CriteriaVO cri);
   public List<MarketBoardVO> getList_etc(CriteriaVO cri);
   
   
   
   
}