import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;


//!! 중복 x 순서 x !!


class Car{
	
	private String model;
	private String color;
	private int price;
	
	public Car(String model, String color,int price) {
		this.model = model;
		this.color = color;
		this.price = price;
	}
	
	@Override
	public String toString() {
		return model+", "+color +", "+ price;  //String.valueOf 정수 -> 문자
	}
	
	@Override
	public int hashCode() {
		
		return Objects.hash(model,color);
	}
	
//	@Override
//	public boolean equals(Object obj) {
//		if(this.model == ((Car)obj).model && this.color == ((Car)obj).color)
//			return true;
//		else
//			return false; 
//	}
	
	@Override
	public boolean equals(Object obj) {
		String m = ((Car)obj).model;
		String c = ((Car)obj).color;
		int p = ((Car)obj).price;
//		if(model.equals(m) && color.equals(c)) return true;
//		else return false;
		return (model.equals(m)&& color.equals(c)&& this.price == p) ? true : false;
	}
	
}

public class HashSetEx03 {

	public static void main(String[] args) {
		Set<Car> set = new HashSet<Car>();
		
		set.add(new Car("Y201","red",100));
		set.add(new Car("Y202","black",200));
		set.add(new Car("Y201","red",300));
		set.add(new Car("Y201","white",400));
		set.add(new Car("Y203","black",500));
		
		System.out.println("cnt : "+set.size());
		
		for(Iterator<Car> itr = set.iterator(); itr.hasNext();)
				System.out.print(itr.next()+ "\t");
	
	}//main
}
