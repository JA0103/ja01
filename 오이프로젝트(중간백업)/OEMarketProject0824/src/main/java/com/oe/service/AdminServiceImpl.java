package com.oe.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminServiceImpl implements AdminService{

	private AdminMapper mapper;
	
	@Override
	public List<MarketUserVO> adminUserId() {
		return mapper.getUserId();
	}
	
	@Override
	public List<MarketUserVO> adminUserList() {
		return mapper.readUserList();
	}
	
	@Override
	public List<MarketUserVO> adminUserList2() {
		return mapper.readUserList();
	}
	

	@Override
	public List<MarketBoardVO> adminBoardList() {
		return mapper.readBoardList();
	}



}
