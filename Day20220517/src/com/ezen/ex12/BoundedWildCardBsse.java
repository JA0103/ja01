package com.ezen.ex12;


class Box<T>{
	private T ob;
	public T getOb() {return ob;}
	public void setOb(T ob) {this.ob = ob;}
	
	@Override
	public String toString() {
		return ob.toString();
	}
}


class Toy{
	@Override
	public String toString() {
		return "I am Toy";
	}
}

class Robot extends Toy{}

		


class BoxHandler{  //box 전달 대상은 Toy, Robot
	public static void outBox(Box<? extends Toy> box) {//box -> Toy또는 Toy상속한
		Toy t = box.getOb();	//extends --> get만 가능
		System.out.println(t);
//		box.setOb(t);
	}
	
	public static void inBox(Box<? super Toy> box, Toy t) {//box-> Toy,Object
		box.setOb(t);			//super --> set만 가능
//		Toy t2 = box.getOb();  //Box<Object(상위)> box -> (하위)Toy에 넣을 수 없어서 안됨
		Object t2 = box.getOb();  
		
	}
}

public class BoundedWildCardBsse {

	public static void main(String[] args) {
		Box<Toy> box = new Box<>();
		BoxHandler.inBox(box, new Toy());
		
		BoxHandler.outBox(box);
	}

}
