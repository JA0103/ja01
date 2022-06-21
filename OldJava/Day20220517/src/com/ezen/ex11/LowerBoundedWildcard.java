package com.ezen.ex11;


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
														//Integer,Number,Object
	public static void peekBox(Box<? super Integer> box) {  //와일드카드  상한제한
		System.out.println(box);
	}
}

public class LowerBoundedWildcard {

	public static void main(String[] args) {
		Box<Integer> box = new Box<>();
		box.setOb(100);
		Unboxer.peekBox(box); 

		Box<Number> box2 = new Box<>();
		box2.setOb(10.4);
		Unboxer.peekBox(box2); 

		Box<Object> box3 = new Box<>();
		box3.setOb("string");
		Unboxer.peekBox(box3); 
	}

}
