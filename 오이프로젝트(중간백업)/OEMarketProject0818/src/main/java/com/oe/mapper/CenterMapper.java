package com.oe.mapper;

import java.util.List;

import com.oe.domain.CenterVO;

public interface CenterMapper {
	public void QnAInstert(CenterVO vo); //문의 등록
	public List<CenterVO> getQnAList(String us_id); //문의 등록
}
