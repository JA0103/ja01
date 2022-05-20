package com.exzen.Ex04;

interface Printable4{ void print(String s); }

interface Calculate{
	void cal(int n1, int n2);
}

class Cal implements Calculate{

	@Override
	public void cal(int n1, int n2) {
		System.out.println(n1+n2);
	}
	
}//ctrl+shft+{

public class Lambda4 {

	
	public static void main(String[] args) {
		
		// 람다
		Printable4 prn =(String s) -> {
			System.out.println(s);
		}; 

		prn = (String s) ->{ System.out.println(s);}; 
		prn.print("lambda1!");
		
		prn = (String s) -> System.out.println(s); 
		prn.print("lambda2!");
		
		prn = (s) -> System.out.println(s); 
		prn.print("lambda3!");
		
		prn = s -> System.out.println(s); 
		prn.print("lambda4!");
		
		System.out.println("================");
		Calculate c = new Cal();
		c.cal(10, 10);
		
		System.out.println("================");
		
		Calculate cc ;
		cc = (int n1, int n2) -> { System.out.println(n1+n2); };
		cc.cal(5, 3);
		
		System.out.println("================");
		
		cc = (n1, n2) -> { System.out.println(n1-n2); };
		cc.cal(5, 3);
		
		System.out.println("================");
		
		cc = (n1, n2) -> System.out.println(n1*n2); 
		cc.cal(7, 3);
		
		
		
		
	}

}
