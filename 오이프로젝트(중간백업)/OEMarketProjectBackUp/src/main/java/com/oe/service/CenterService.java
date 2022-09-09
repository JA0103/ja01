package com.oe.service;

import java.util.List;

import com.oe.domain.CenterVO;
import com.oe.domain.Criteria_suggest;

public interface CenterService {
	public void QnAInstert(CenterVO vo); //문의 등록
	public void SuggestInstert(CenterVO vo); //건의사항 등록
	public List<CenterVO> getQnAList(String us_id); //문의 내역 불러오기
	public List<CenterVO> getSuggestList(); //건의 내역 불러오기
	public CenterVO getQnA(String us_id); //문의 글 불러오기
	public List<CenterVO> getSuggestListWithPaging(
			Criteria_suggest cri,String my_id
	      );
	public int getSuggestTotal(String us_id);// 건의 내역 갯수
}
