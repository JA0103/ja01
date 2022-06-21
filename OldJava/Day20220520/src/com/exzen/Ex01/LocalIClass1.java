package com.exzen.Ex01;

import java.util.ArrayList;
import java.util.List;

interface Printable{
	void print();
 }
class Papers{
	private String con;
	public Papers(String s) {con = s;}
	
	public Printable getPrinter(){
		//local class
		class Printer implements Printable{
			public void print() {
				System.out.println(con);
			}
		}
		return new Printer();
	}
}

public class LocalIClass1 {

	public static void main(String[] args) {
		Papers p = new Papers("message");
		Printable prn = p.getPrinter();
		prn.print();
		
	}
}
