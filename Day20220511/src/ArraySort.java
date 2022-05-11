import java.util.Arrays;

public class ArraySort {

	public static void main(String[] args) {
		
		Person[] person = new Person[3];
		
		person[0] = new Person("김대철", 25);
		person[1] = new Person("김신영", 30);
		person[2] = new Person("남궁수연", 22);

		Arrays.sort(person);
		
		for(Person p: person )
			System.out.println(p);
		
		
	}

}

class Person implements Comparable{
	private String name;
	private int age;
	
//	public Person() {}
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "name= " + name + ", age= " + age ;
	}

	//나이순
//	@Override
//	public int compareTo(Object o) {
//		Person p = (Person)o;
////		if(this.age > p.age) return 1 ;
////		else if(this.age < p.age) return -1;
////		else return 0;
//		
//		return p.age - this.age ;
//		
//	}
	
	//이름 사전순
//	@Override
//	public int compareTo(Object o) {
//		Person p = (Person)o;
//		return this.name.compareTo(p.name);
//	}
	
	//이름 길이순
	@Override
	public int compareTo(Object o) {
		Person p = (Person)o;
		return this.name.length() - p.name.length();
	}
	
	
}

