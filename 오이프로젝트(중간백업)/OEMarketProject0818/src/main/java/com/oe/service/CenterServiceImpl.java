package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.CenterVO;
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

}
