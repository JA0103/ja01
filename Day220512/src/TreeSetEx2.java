import java.util.Iterator;
import java.util.TreeSet;

class Person1 implements Comparable<Person1>{

	String name;
	int age;
		
	public Person1(String name, int age) {
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return name+ " : " + age;
	}

	@Override
	public int compareTo(Person1 o) {
		// TODO Auto-generated method stub
		return this.age-o.age;
	}
	
	
	
}//class person


public class TreeSetEx2 {

	public static void main(String[] args) {
		TreeSet<Person1> tree = new TreeSet<Person1>();
		tree.add(new Person1("Kim",20));
		tree.add(new Person1("Park",50));
		tree.add(new Person1("Lee",80));
		tree.add(new Person1("Lee",80));
		tree.add(new Person1("Kim",29));
		tree.add(new Person1("Kim",80));
		
		for(Person1 n : tree)
			System.out.println(n);
		
			
		
		
	}//main

}
