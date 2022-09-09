package com.oe.mapper;

import java.util.List;

import com.oe.domain.Criteria_center;
import com.oe.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getListFaqTop5();
	public NoticeVO getRecentNotice();
	public int us_gradeChk(String us_id);
	public List<NoticeVO> getListFaqWithPaging(Criteria_center cri);
	public int getCountFAQ(Criteria_center cri);
}
