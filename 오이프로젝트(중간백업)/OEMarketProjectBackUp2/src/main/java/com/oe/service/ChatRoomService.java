package com.oe.service;

import java.util.List;

import com.oe.domain.ChatRoomVO;

public interface ChatRoomService {
	public void register(String cr_buyer,String cr_seller);
	public int checkRoom(String my_nickname,String cr_seller);
	public List<ChatRoomVO> RoomList(String my_nickname);
}
