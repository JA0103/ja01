package com.exzen.Ex04;

interface Printable3{ void print(String s); }

public class Lambda3 {

	public static void main(String[] args) {
		
		// 람다
		Printable3 prn = (s) -> System.out.println(s); 
		
		prn.print("lambda3!");
		
	}

}
