package com.ezen.ex09;


class Box<T>{
	private T ob;
	public T getOb() {return ob;}
	public void setOb(T ob) {this.ob = ob;}
	
	@Override
	public String toString() {
		return ob.toString();
	}
}

class Unboxer{//시그니처 반환타입 매개변수
	
	public static void peekBox(Box<? extends Number> box) {  //와일드카드 하한제한
		System.out.println(box);
	}
}

public class UpperBoundedWildcard {

	public static void main(String[] args) {
		Box<Integer> box = new Box<>();
		box.setOb(100);
		
		System.out.println(box.getOb());
		
		Unboxer.peekBox(box); 
	}

}
