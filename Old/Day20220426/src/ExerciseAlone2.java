
public class ExerciseAlone2 {

	public static void main(String[] args) {

		Car3 c1 = new Car3();
		Car3 c2 = new Car3();
		Car3 c3 = new Car3();
		c1.num++;
		
		System.out.println(c1.num);
		System.out.println(c2.num);
		System.out.println(c3.num);
		
		//Car2 c4 = new Car2();  -->private Car2() =>private 이기 때문에 읽지 못해 에러.
		Car4 c4 = Car4.getCar2();
		System.out.println(c4.getNum());
		
		
	}

}


class Car3{
	int num =10;
	
	public Car3() {
		
	}
}



class Car4{
	
	private static Car4 car4 = null;
	
	private int num =100;
	
	private Car4() {   //private 
		
	}
	
	public static Car4 getCar2() {
		if(car4 == null) {
			car4 = new Car4();
		}
		return car4;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
}
