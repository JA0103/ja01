package com.oe.service;

import java.util.List;

import com.oe.domain.SellBoardVO;

public interface SellBoardService {
	public List<SellBoardVO> readSellAll(String my_id);
}
