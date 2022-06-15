package com.it.controller.action;

public class EmpActionFactory {
	
	private EmpActionFactory() {}
	private static EmpActionFactory instance = new EmpActionFactory();
	
	public static EmpActionFactory getinstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action=null;
		
		if(command.equals("emp_list")) {
			action = new EmpListAction(); 
		}
		return action;
	}
	
	
	
}
