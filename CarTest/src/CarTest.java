import lombok.Getter;
import lombok.Setter;

public class CarTest {

	public static void main(String[] args) {

		Sedan se = new Sedan();
		se.setColor("red");
		System.out.println(se.getColor());
		
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
		
		Sedan testtest = new Sedan();
		testtest.run();  //--> 본인한테 없으면 상위클래스 것을 갖다 씀
		//(상위 클래스에 있는 것은 하위클래스에 있는 것을 갖다 쓸 수 없다!)

		Car test= new Car();
		test.run();  
	}
}

@Getter
@Setter
class Car {
	private int passenger;
	private int tire;
	private int seat;
	
	public Car() {}  // 클래스 내에 매개변수가 있는 생성자가 있으면 디폴트 생성자 만들어줘야함 *!*
	
	public Car(int passenger, int tire, int seat) {
		this.passenger = passenger;
		this.tire = tire;
		this.seat = seat;
		System.out.println("Car()생성자"); 
	}
	
	void run() {
		System.out.println("Car 달려!!!");
	}
	
	void stop() {}
}

@Getter
@Setter
class Sedan extends Car {
	private String color;
	public Sedan() {}
	


	public Sedan(String color, int passenger, int tire, int seat) {
		super(passenger, tire, seat);  //super) 상위 클래스 생성자에게 전달 
									// 상위클래스인 Car가 먼저 생성되기 때문에 super가 위에있어야함
		this.color = color;
//		이렇게 대입도 가능 (getter,setter)
//		setPassenger(passenger);
//		setTire(tire);
//		setSeat(seat);
		System.out.println("Sedan()생성자");
	}
	
	void gas() {}
}

@Getter
@Setter
class Sports extends Sedan {
	private int horsepower;
	
	public  Sports() {} 
	


	public Sports(String color, int passenger, int tire, int seat,int horsepower) {
		super(color, passenger, tire, seat);
		this.horsepower = horsepower; // 클래스 내에 있는 것은 취하고 상위클래스에 있는 것은 super로 
		System.out.println("Sports()생성자");
	}
	
	void run() {
		System.out.println("스포츠카 달려!!!");
	}
}

@Getter
@Setter
class Bus extends Car {
	int passengerCount;
	void passengerLoad() {}
	
}

@Getter
@Setter
class Truck extends Car { 
	int load;
	void ObjectLoad() {}
	
}

