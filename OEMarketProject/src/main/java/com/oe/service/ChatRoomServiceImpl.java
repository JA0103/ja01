package com.oe.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.oe.domain.ChatRoomVO;
import com.oe.mapper.ChatRoomMapper;

public class ChatRoomServiceImpl implements ChatRoomService{
	
	@Autowired
	private ChatRoomMapper mapper;
	
	@Override
	public void register(String us_nickname) {
		mapper.insert(us_nickname);
	}

	@Override
	public String checkRoom(String us_nickname) {
		
		return mapper.Chk_Room(us_nickname);
	}

}
