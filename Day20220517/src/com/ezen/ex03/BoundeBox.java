package com.ezen.ex03;

// T : 객체면 뭐든 ok 
class Box<T extends Number>{//T에 올 수 있는 대상은 Number이거나 Number를 상속한 객체만 가능
	private T ob;
	
	public void set(T o) {
		ob = o;
	}
	
	public T get() {
		return ob;
	}
	
}

class Person{}

public class BoundeBox {

	public static void main(String[] args) {

		Box<Long> aBox = new Box<>();
//		Box<String> sBox = new Box<>();  // Number를 상속 받는 애들만 가능!
		aBox.set(100L);
		
		System.out.println(aBox.get());
	}

}
