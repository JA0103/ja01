package com.oe.domain;

import lombok.Data;

/*
CR_ROOMNUMBER          NUMBER       
CR_ROOMNAME   NOT NULL VARCHAR2(50) 
CR_SELLER              VARCHAR2(30) 
CR_BUYER               VARCHAR2(30) 
*/
@Data
public class ChatRoomVO {
	private int cr_roomNumber;
	private String cr_roomName, cr_seller, cr_buyer;
	
}