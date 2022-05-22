
class Outer{
	int value=10;
	
	class Inner{
		int value=20;
		void method1() {
			int value=30;
			
			System.out.println(value);
			System.out.println(this.value);
			System.out.println(Outer.this.value);
		}
	}//inner
}//outer

public class Ex07_25 {

	public static void main(String[] args) {
		Outer o = new Outer();
		Outer.Inner inner = o.new Inner();
		
		inner.method1();
	}
}
