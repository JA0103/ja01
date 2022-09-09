package com.oe.service;

import java.util.List;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;
import com.oe.domain.MyPageVO;

public interface AdminService {
	 public List<MarketUserVO> adminUserId();
	 public List<MarketUserVO> adminUserList();
	 public List<MarketUserVO> adminUserList2();
	 public List<MarketBoardVO> adminBoardList();
//	 public MyPageVO readUserInfo(String user_id);
//	 public List<MarketBoardVO> adminBoardList();
	 
}
