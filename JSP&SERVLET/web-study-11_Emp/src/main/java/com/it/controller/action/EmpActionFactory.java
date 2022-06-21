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
		}else if(command.equals("emp_insert_form")) {
			action = new EmpInsertFormAction();
		}else if(command.equals("emp_insert")) {
			action = new EmpInsertAction();
		}else if(command.equals("emp_detail_form")) {
			action = new EmpDtailFormAction();
		}else if(command.equals("emp_update_form")) {
			action = new EmpUpdateFormAction();
		}else if(command.equals("emp_update")) {
			action = new EmpUpdateAction();
		}else if(command.equals("emp_delete")) {
			action = new EmpDeleteAction();
		}
		 
		return action;
	}
	
	
	
}
