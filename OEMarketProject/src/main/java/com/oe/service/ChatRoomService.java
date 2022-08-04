package com.oe.service;

import com.oe.domain.ChatRoomVO;

public interface ChatRoomService {
	public void register(String us_nickname);
	public String checkRoom(String us_nickname);
}
