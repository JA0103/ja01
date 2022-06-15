package com.saeyan.controller.action;

public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {}
	
	public static ActionFactory getinstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory: "+ command);
		
		if(command.equals("board_list")) {
			action = new BoardListAction();
		}else if(command.equals("board_write_form")) {
			action = new BoardFormAction();
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		}
		
		return action;
	}
	
}
