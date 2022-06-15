import java.util.ArrayList;

class Fruit{@Override public String toString() {return "Fruit";}}
class Apple1 extends Fruit{@Override public String toString() {return "Apple";}}
class Grape extends Fruit{@Override public String toString() {return "Grape";}}
class Toy{@Override public String toString() {return "Toy";}}


public class FruitBoxEx1 {

	public static void main(String[] args) {

		Box1<Fruit> fruitBox = new Box1<Fruit>();
		Box1<Apple1> appleBox = new Box1<Apple1>();
		Box1<Toy> toyBox = new Box1<Toy>();
//		Box<Grape> grapeBox = new Box<Apple>(); //에러
		
		fruitBox.add(new Fruit());
		fruitBox.add(new Apple1());	//void add(Fruit item)
		
		appleBox.add(new Apple1());
//		appleBox.add(new toy()); //Box<Apple>에는 Apple 만 담을 수 있음
		
		toyBox.add(new Toy());
//		toyBox.add(new Apple());//==위와 동일
		
		System.out.println(fruitBox);
		System.out.println(appleBox);
		System.out.println(toyBox);
		
	}

}


class Box1<T>{
	ArrayList<T> list = new ArrayList<T>();
	void add (T item) {list.add(item); }
	T get(int i) {return list.get(i);}
	int size() {return list.size();}
	@Override
	public String toString() { return list.toString();}
}