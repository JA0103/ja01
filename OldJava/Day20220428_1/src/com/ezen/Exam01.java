package com.ezen;

public class Exam01 {
	public static void main(String[] args) {
		//상위클래스는 자신에게 상속 되어있는 모든 하위클래스에 접근 할 수 있다.
		animal an = new animal();
		animal an2 = new Mammal();
		animal an3 = new Person();
		an.eat();
		an2.eat();
		an3.eat();
		//자신이 참조하고 있는 메소드 우선으로 호출
		
		//an3.run();  --> animal에 run()이 없다. error
		Object obj = new Person();  // Object는 모든 클래스의 최고상위클래스
		//obj.eat();  --> Object에 없다. error
		//===> 상위클래스가 하위클래스에 접근 할 수 있지만,
		//     상위클래스가 갖고 있는 메소드만 접근 할 수 있다
		
		
		Person p = (Person)an3;  //형변환) 
		p.eat();
		p.run();
		// Person만 갖고 있는 메소드까지 모두 가능
		
		//===>> 조상타입 참조변수를 자손타입 참조변수로 변환하는 것은 형변환 생략가능
		// ex. animal an3 = new Person();
		//     자손타입 참조변수 -> 조상타입 참조변수 변환은 형변환 생략 불가능
		// ex. animal ani = new Person();
		//     Person p = (Person)ani;   -> 가능 
		
		//  Person person = (Person)new animal; 
		//  person.eat();   -> error 
		
		animal animal = new Whale();
		
		if( animal instanceof Birds) {
			System.out.println(1);
			Birds birds = (Birds)animal;
		}
		
		else if( animal instanceof Mammal) {
			System.out.println(2);
			Mammal mammal = (Mammal)animal;
			
			System.out.println("-------------------");
			
			animal ani = new animal();
			ani.eat();
			
			ani = new Person();
			Person person = (Person)ani;
			person.eat();
			person.play();
			person.run();
		
			
			ani = (Birds)new Birds();
			ani.eat();
			ani.play();
			
			ani = new animal();
			ani.play();
			
			System.out.println("---------");
			Birds b = new Birds();
			b.eat();
			
			//b= (Person)new Person();
			
		}
	}
}

class animal{  //동물
	void eat() {
		System.out.println("동물이 먹는다");
	}
	void play() {
		System.out.println("동물이 논다");
	}
}

class Mammal extends animal{  //포유류
	void eat() {
		System.out.println("포유류가 먹는다");
	}
}

class Person extends Mammal{  //사람
	void eat() {
		System.out.println("사람이 먹는다");
	}
	void run() {
		System.out.println("사람이 달린다");
		
	}
}
class Whale extends Mammal{  //고래
	void eat() {
		System.out.println("고래가 먹는다");
	}
}


class Birds extends animal{  //조류
	void eat() {
		System.out.println("조류가 먹는다");
	}
}

class Penguin extends Birds{  //펭귄
	void eat() {
		System.out.println("펭귄이 먹는다");
	}
}

class Sparrow extends Birds{  //참새
	void eat() {
		System.out.println("참새가 먹는다");
	}
}