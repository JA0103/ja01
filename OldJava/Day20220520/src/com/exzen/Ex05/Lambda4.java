package com.exzen.Ex05;

interface Printable4{ void print(String s); }

interface Calculate{
	int cal(int n1, int n2);
}

class Cal implements Calculate{

	@Override
	public int cal(int n1, int n2) {
		return n1*n2;
	}
	
}

public class Lambda4 {
	
	public static void main(String[] args) {
		
		// 람다
		Calculate c = (int n1, int n2) -> {
							return n1+n2;
						};
		System.out.println( c.cal(1, 10) );
		
		c = (n1, n2) -> n1+n2;  //return문은 중괄호 생략x
		System.out.println( c.cal(12, 10) );
		
		c = (n1, n2) -> n1*n2;  //return문 자체를 생략o 위에 interface에 반환값이 지정 되어있어서  
		System.out.println( c.cal(12, 10) );
		
		System.out.println("--------------");
		Calculate cc = new Cal();
		System.out.println(cc.cal(4, 5));
		
		
		
	}

}
