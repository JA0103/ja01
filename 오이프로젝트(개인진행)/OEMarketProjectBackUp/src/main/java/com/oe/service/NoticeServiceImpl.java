package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.Criteria_center;
import com.oe.domain.NoticeVO;
import com.oe.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper mapper;
	
	@Override
	public int getUserGrade(String us_id) {
		log.info("getUserGrade----------------------------");
		return mapper.us_gradeChk(us_id);
	}
	
	@Override
	public NoticeVO getNoticeCenter() {
		log.info("getNoticeCenter----------------------------");
		return mapper.getRecentNotice();
	}
	
	@Override
	public List<NoticeVO> getListCenter() {
		log.info("getListCenter----------------------------");
		return mapper.getListFaqTop5();
	}
	
	@Override
	public NoticeVO getNotice(Integer no_num) {
		return mapper.readNotice(no_num);
	}
	
	@Override
	public List<NoticeVO> getListNotice(Criteria_center cri) {
		return mapper.getListNoticeWithPaging(cri);
	}
	
	@Override
	public List<NoticeVO> getListFAQ(Criteria_center cri) {
		log.info("getListFAQ----------------------------");
		return mapper.getListFaqWithPaging(cri);
	}
	
	@Override
	public int getTotalNotice() {
		return mapper.getCountNotice();
	}
	
	@Override
	public int getTotalFAQ(Criteria_center cri) {
		log.info("getTotalFAQ----------------------------");
		return mapper.getCountFAQ(cri);
	}
}
