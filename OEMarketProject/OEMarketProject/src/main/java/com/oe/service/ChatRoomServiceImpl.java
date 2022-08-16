package com.oe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oe.mapper.ChatRoomMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService{
	
	@Autowired
	private ChatRoomMapper mapper;
	
	@Override
	public void register( String cr_buyer,String cr_seller) {
		mapper.insert(cr_buyer,cr_seller);
	}

	@Override
	public String checkRoom(String cr_seller, String cr_buyer) {
		
		return mapper.Chk_Room(cr_seller, cr_buyer);
	}

}
