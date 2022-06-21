package com.ezen;

public class CarTest {

	public static void main(String[] args) {
		
		Sedan se = new Sedan();
		se.setColor("red");
		System.out.println(se.getColor());
		se.setPassenger(4);
		System.out.println(se.getPassenger()+"명");
		System.out.println("---------------------------");
		Sedan se2 = new Sedan("blue", 2 , 4 , 3);
		System.out.println(se2.getPassenger() + "명");
		System.out.println(se2.getColor());
		
		System.out.println("---------------------------");
		Sports sp = new Sports();
		sp.setColor("red");
		System.out.println(sp.getColor());
		
		System.out.println("---------------------------");
		Sports sp2 = new Sports("yellow", 2, 4, 1, 5000);
		System.out.println(sp2.getColor() + "색, " + sp2.getPassenger() + "명, "+ sp2.getTire()+ "개, "
							+sp2.getSeat()+ "좌석, " + sp2.getHorsepower() );
		
		System.out.println("---------------------------");
		sp2.run();  //--> Sports에 있는 run() 실행
		
		Car test= new Car();
		test.run();  //--> Car에 있는 run() 실행
		//상위 클래스에 있는 것은 하위클래스에만 있는 것을 갖다 쓸 수 없다!
		
		Sedan testtest = new Sedan();
		testtest.run();  //--> 본인한테 없으면 상위클래스 것을 갖다 씀
	}
}//class CarTest

class Car {
	private int passenger;
	private int tire;
	private int seat;
	
	public Car() {}
	
	public Car(int passenger, int tire, int seat) {
		this.passenger = passenger;
		this.tire = tire;
		this.seat = seat;
		System.out.println("Car()생성자");
	}
	
	//
	public int getPassenger() {
		return passenger;
	}
	public void setPassenger(int passenger) {
		this.passenger = passenger;
	}
	public int getTire() {
		return tire;
	}
	public void setTire(int tire) {
		this.tire = tire;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}//
	
	void run() {
		System.out.println("달려!!!");
	}
	void stop() {}
}

class Sports extends Sedan {
	private int horsepower;
	
	//
	public int getHorsepower() {
		return horsepower;
	}
	public void setHorsepower(int horsepower) {
		this.horsepower = horsepower;
	}//
	
	public  Sports() {}
	
	public Sports(String color, int passenger, int tire, int seat,int horsepower) {
		super(color, passenger, tire, seat);
		this.horsepower = horsepower;
		System.out.println("Sports()생성자");
	}
	
	void run() {
		System.out.println("스포츠카 달려!!!");
	}
	
}//class Sports

class Sedan extends Car {
	private String color;
	
	public Sedan() {}//클래스 내에 매개변수가 있는 생성자가 있으면 디폴트 생성자 만들어줘야함 *!*
	
	public Sedan(String color, int passenger, int tire, int seat) {
		super(passenger, tire, seat);  //상위 클래스 생성자에게 전달 -> Car 생성자 // 상위클래스인 Car가 먼저 생성되기 때문에 super가 위에있어야함
		this.color = color;
//		이렇게 대입도 가능 (getter,setter)
//		setPassenger(passenger);
//		setTire(tire);
//		setSeat(seat);
		System.out.println("Sedan()생성자");

	}
	
	//
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}//


	void gas() {}
	
}//class Sedan

class Bus extends Car {
	int passengerCount;
	void passengerLoad() {}
	
}//class Bus

class Truck extends Car { 
	int load;
	void ObjectLoad() {}
	
}//class Truck

