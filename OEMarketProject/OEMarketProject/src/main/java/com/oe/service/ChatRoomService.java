package com.oe.service;

public interface ChatRoomService {
	public void register(String cr_buyer,String cr_seller);
	public String checkRoom(String cr_seller, String cr_buyer);
}
