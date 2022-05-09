package com.ezen0504;

public class EqualsEx1 {

	public static void main(String[] args) {
		 Value v1 = new Value(10);
		 Value v2 = new Value(10);
		 
		
		 if(v1.equals(v2))
			 System.out.println("같다");
		 else {
			 System.out.println("다르다");
		 }
		 
		 v2 = v1;
		
		 if(v1.equals(v2))
			 System.out.println("같다");
		 else {
			 System.out.println("다르다");
		 }
		 
		 System.out.println("=================");
		 
		 Person p1 = new Person(1859005);
		 Person p2 = new Person(1859005);
		 
		 if(p1.equals(p2)) {
			 System.out.println("같다");
		 }else {
			 System.out.println("다르다");
		 }
		 
	}

}

class Person{
	int num;
	
	Person(int num){
		this.num=num;
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Person) {
			return num == ((Person)obj).num;
		}
		return false;
	}
}


class Value{
	int value;
	
	Value(int value){
		this.value=value;
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Value) {
			return value == ((Value)obj).value;
		}
			
		return false;
	}
}