package com.oe.service;

import java.util.List;

import com.oe.domain.CriteriaVO;
import com.oe.domain.MarketBoardVO;

public interface MarketBoardService {
   
   // 크롤링
   public void crawlingDelete();
   public void crawlingregister(MarketBoardVO vo);
   
   public void register(MarketBoardVO vo);
   public MarketBoardVO get(Long bo_num);
   public int modify(MarketBoardVO vo);
   public int remove(Long bo_num);
   
   // 상품 정렬
   public List<MarketBoardVO> boardListOrderByHeart(CriteriaVO cri);
   public List<MarketBoardVO> boardListOrderByRegdate(CriteriaVO cri);
   public List<MarketBoardVO> boardListOrderByLowPrice(CriteriaVO cri);
   public List<MarketBoardVO> boardListOrderByHighPrice(CriteriaVO cri);
   
   // 상품 상세보기
   public MarketBoardVO boardDetail(Long bo_num);
   // 상품 수정
   public int boardUpdate(MarketBoardVO vo);
   // 상품 삭제
   public int boardDelete(Long bo_num);

   // 페이지 총 갯수
   public int getTotal(CriteriaVO cri);
   
   // 0815 카테고리 정렬
   public List<MarketBoardVO> categoryBook(CriteriaVO cri);
   public List<MarketBoardVO> categoryMusic(CriteriaVO cri);
   public List<MarketBoardVO> categoryArt(CriteriaVO cri);
   public List<MarketBoardVO> categoryWoman(CriteriaVO cri);
   public List<MarketBoardVO> categoryMan(CriteriaVO cri);
   public List<MarketBoardVO> categoryShoes(CriteriaVO cri);
   public List<MarketBoardVO> categoryBag(CriteriaVO cri);
   public List<MarketBoardVO> categoryWatch(CriteriaVO cri);
   public List<MarketBoardVO> categoryJewelry(CriteriaVO cri);
   public List<MarketBoardVO> categoryFuniture(CriteriaVO cri);
   public List<MarketBoardVO> categoryCar(CriteriaVO cri);
   public List<MarketBoardVO> categoryKidult(CriteriaVO cri);
   public List<MarketBoardVO> categoryFood(CriteriaVO cri);
   public List<MarketBoardVO> categoryPet(CriteriaVO cri);
   public List<MarketBoardVO> categoryEtc(CriteriaVO cri);

   // 조회수 올리기
   public int updateViewCnt(Long bo_num);



   
    
}