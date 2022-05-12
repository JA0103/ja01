import java.util.HashSet;
import java.util.Objects;

public class HashSetEx {

	public static void main(String[] args) {
		
		HashSet set = new HashSet();
		
		set.add("abc");
		set.add("abc");
		set.add(new Person("Daivd",10));
		set.add(new Person("Daivd",10));
		
		System.out.println(set);
	}

}

class Person{
	String name;
	int age;
	
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	@Override
	public String toString() {
		return name + " : " + age;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(name,age);
	}
	
	@Override
	public boolean equals(Object obj) {
//		if(this.name==((Person)obj).name && this.age==((Person)obj).age)
//			return true;
//		else
//			return false;
		
		Person tmp = (Person)obj;
		return name.equals(tmp.name) && age==tmp.age ? true : false;
	}
}