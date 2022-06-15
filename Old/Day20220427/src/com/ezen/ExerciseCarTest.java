package com.ezen;

import lombok.Getter;
import lombok.Setter;

public class ExerciseCarTest {

	public static void main(String[] args) {
		//
		Sedan se = new Sedan();
		se.setColor("red");
		System.out.println(se.getColor());
		
		System.out.println("---------------------------");
		Sedan1 se3 = new Sedan1("blue", 2 , 4 , 3);
		System.out.println(se3.getPassenger() + "명");
		System.out.println(se3.getColor());
		
		System.out.println("---------------------------");
		Sports1 sp3 = new Sports1("yellow", 2, 4, 1, 5000);
		System.out.println(sp3.getColor() + "색, " + sp3.getPassenger() + "명, "+ sp3.getTire()+ "개, "
							+sp3.getSeat()+ "좌석, " + sp3.getHorsepower() );
		
		System.out.println("---------------------------");
		Sports1 sp5 = new Sports1(2,10000);
		System.out.println(sp5.getSeat() + ", "+ sp5.getHorsepower());
		System.out.println(sp5.getColor());
		System.out.println("---------------------------");
		
		sp3.run();  //--> Sports에 있는 run() 실행
		
		Car1 test1= new Car1();
		test1.run();  //--> Car에 있는 run() 실행
		//상위 클래스에 있는 것은 하위클래스에만 있는 것을 갖다 쓸 수 없다!
		
		Sedan1 testtest1 = new Sedan1();
		testtest1.run();  //--> 본인한테 없으면 상위클래스 것을 갖다 씀
	}
}//class CarTest

@Getter
@Setter
class Car1 {
	private int passenger;
	private int tire;
	private int seat;
	
	public Car1() {}
	
	public Car1(int passenger, int tire, int seat) {
		this.passenger = passenger;
		this.tire = tire;
		this.seat = seat;
	}
	
	void run() {
		System.out.println("go go~!");
	}
	void stop() {}
	
}
@Getter
@Setter
class Sedan1 extends Car1 {
	private String color;
	
	public Sedan1() {}
	
	

	public Sedan1(String color, int passenger, int tire, int seat) {
		super(passenger, tire, seat);
		this.color = color;
	}
	
	void gas() {}
	

} 
@Getter
@Setter

class Sports1 extends Sedan1 {
	private int horsepower;
	
	public Sports1() {}
	




	public Sports1(String color, int passenger, int tire, int seat,int horsepower) {
		super(color, passenger, tire, seat );
		this.horsepower = horsepower;
	}
	
	public Sports1(int seat, int horsepower) {
		super("black", 0, 0, seat);
		this.horsepower = horsepower;
	}
	
	void run() {
		System.out.println("출발!");
	}
}
@Getter
@Setter

class Bus1 extends Car1 {
	private int passengerCount;
	void passengerLoad() {};
}
@Getter
@Setter

class Truck1 extends Car1 {
	private int load;
	void ObjectLoad() {}
}


