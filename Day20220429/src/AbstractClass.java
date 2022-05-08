import javax.swing.plaf.synth.SynthOptionPaneUI;

public class AbstractClass {

	public static void main(String[] args) {
		
		Product pro = new Audio();
		
		System.out.println(pro.price);
		pro.test();
		pro.func();
		
		Object obj = new Tv1();
		System.out.println(obj.toString());
	}

}
abstract class Product {
	int price; // 제품의 가격
	Product(int price) {
		this.price = price;
	}
	
	void test() {
		System.out.println("Product");
	}
	
	abstract void func(); //추상메소드
}

class Tv1 extends Product {
	Tv1() { super(100); }
	
	public String toString() { return "Tv"; }

	@Override
	void func() {
		System.out.println("tv");

	}
	
}

class Computer extends Product {
	Computer() { super(200); }
	
	public String toString() { return "Computer";}

	@Override
	void func() {
		System.out.println("Computer");
	}
	
}

class Audio extends Product {
	Audio() { super(50); }
	
	public String toString() { return "Audio"; }

	@Override
	void func() {
		System.out.println("Audio");

	}
	
}