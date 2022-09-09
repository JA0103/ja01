package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.CenterVO;
import com.oe.domain.Criteria_suggest;
import com.oe.mapper.CenterMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CenterServiceImpl implements CenterService {
	private CenterMapper mapper;
	@Override
	public void QnAInstert(CenterVO vo) {
		mapper.QnAInstert(vo);
	}
	@Override
	public List<CenterVO> getQnAList(String us_id) {
		return mapper.getQnAList(us_id);
	}
	@Override
	public CenterVO getQnA(String us_id) {
		return mapper.getQnA(us_id);
	}
	@Override
	public void SuggestInstert(CenterVO vo) {
		mapper.SuggestInstert(vo);
	}
	@Override
	public List<CenterVO> getSuggestList() {
		return mapper.getSuggestList();
	}
	@Override
	public List<CenterVO> getSuggestListWithPaging(Criteria_suggest cri, String my_id) {
		return mapper.getSuggestListWithPaging(cri, my_id);
	}
	@Override
	public int getSuggestTotal(String us_id) {
		return mapper.getSuggestTotal(us_id);
	}

}
