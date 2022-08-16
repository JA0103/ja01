package com.oe.mapper;

import org.apache.ibatis.annotations.Param;

public interface ChatRoomMapper {
	public void insert(@Param("cr_buyer") String cr_buyer,@Param("cr_seller") String cr_seller);
	public String Chk_Room(@Param("cr_buyer") String cr_buyer,@Param("cr_seller") String cr_seller);
}
