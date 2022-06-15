import java.util.ArrayList;
import java.util.List;

class Apple2{
	@Override
	public String toString() {
		return "Real Apple";
	}
}

class Orange2{
	@Override
	public String toString() {
		return "Real Orange";
	}
}

class Box2<T>{
	private T obj;

	public T getObj() {
		return obj;
	}

	public void setObj(T obj) {
		this.obj = obj;
	}
	
	
	
}




public class GenericsEx2 {

	public static void main(String[] args) {
		Box2<Apple2> ap = new Box2<Apple2>();
		
		Box2<Orange2> or = new Box2<Orange2>();
		
		ap.setObj(new Apple2());
		or.setObj(new Orange2());
		
		Apple2 abox =  ap.getObj();
		Orange2 obox = or.getObj();
		
		System.out.println(abox);
		System.out.println(obox);

		System.out.println("-------------");
		
		List<String> list = new ArrayList<String>();
		list.add("java");
		System.out.println(list);
		
		System.out.println("-------------");
		
		Box2<String> sb = new Box2<String>();
		
		sb.setObj("fdjkslgj");
		
		System.out.println(sb.getObj());
		
		
	}

}
