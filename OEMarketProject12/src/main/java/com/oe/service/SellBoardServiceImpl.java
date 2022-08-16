package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.SellBoardVO;
import com.oe.mapper.SellBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class SellBoardServiceImpl implements SellBoardService {
	private SellBoardMapper mapper; 
	
	@Override
	public List<SellBoardVO> readAll(String my_id) {
		log.info("getList======================");
		return mapper.getList(my_id);
	}

}
