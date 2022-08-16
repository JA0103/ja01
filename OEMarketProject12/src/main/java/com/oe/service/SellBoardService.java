package com.oe.service;

import java.util.List;

import com.oe.domain.SellBoardVO;

public interface SellBoardService {
	public List<SellBoardVO> readAll(String my_id);
}
