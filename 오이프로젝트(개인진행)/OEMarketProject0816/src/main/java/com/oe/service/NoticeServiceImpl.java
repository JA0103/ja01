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
	public List<NoticeVO> getListCenter() {
		log.info("getListCenter----------------------------");
		return mapper.getListFaqTop5();
	}
	
	@Override
	public NoticeVO getNoticeCenter() {
		log.info("getCenter----------------------------");
		return mapper.getRecentNotice();
	}
	
	@Override
	public int getUserGrade(String us_id) {
		return mapper.us_gradeChk(us_id);
	}
	
//	@Override
//	public List<NoticeVO> getListFAQ(Criteria_center cri) {
//		return mapper.getListFaqWithPaging(cri);
//	}
//	
//	@Override
//	public int getTotalFAQ(Criteria_center cri) {
//		return mapper.getCountFAQ(cri);
//	}
}
