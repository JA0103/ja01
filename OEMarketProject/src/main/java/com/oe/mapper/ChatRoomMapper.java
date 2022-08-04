package com.oe.mapper;

import com.oe.domain.ChatRoomVO;

public interface ChatRoomMapper {
	public void insert(String us_nickname);
	public String Chk_Room(String us_nickname);
}
