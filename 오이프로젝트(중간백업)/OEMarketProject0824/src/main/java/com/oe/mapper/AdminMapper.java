package com.oe.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oe.domain.MarketBoardVO;
import com.oe.domain.MarketUserVO;

public interface AdminMapper {

	
	public List<MarketUserVO> readUserList();
//	public List<MarketUserVO> readUserList2(String user_id);
	public List<MarketBoardVO> readBoardList();
	public List<MarketUserVO> getUserId();
	
    public void updateBoardCnt(@Param("re_id") String re_id, @Param("amount") int amount);
    public void updateReplyCnt(@Param("re_id") String re_id, @Param("amount") int amount);
}
