package com.oe.service;

import java.util.List;

import com.oe.domain.Criteria_center;
import com.oe.domain.NoticeVO;

public interface NoticeService {
	public List<NoticeVO> getListCenter(); //고객센터 메인페이지에 표시되는 자주 하는 질문 조회수 상위 5개
	public NoticeVO getNoticeCenter(); //고객센터 메인페이지에 표시되는 최근 공지사항 1개
	public int getUserGrade(String us_id); //고객센터 페이지 컨텐츠 표시에 차이를 두기 위한 회원 등급 확인(관리자 or 그 외)
//	public List<NoticeVO> getListFAQ(Criteria_center cri); //자주 하는 질문 목록
//	public int getTotalFAQ(Criteria_center cri); //자주 하는 질문 게시글 갯수
}
