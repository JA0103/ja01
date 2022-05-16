
class Apple{
	@Override
	public String toString() {
		return "Real Apple";
	}
}

class Orange{
	@Override
	public String toString() {
		return "Real Orange";
	}
}

class Box{
	private Object obj;

	public Object getObj() {
		return obj;
	}

	public void setObj(Object obj) {
		this.obj = obj;
	}
	
	
	
}

//class AppleBox{
//	private Apple ap;
//
//	public Apple getAp() {
//		return ap;
//	}
//
//	public void setAp(Apple ap) {
//		this.ap = ap;
//	}
//	
//}
//
//class OrangeBox{
//	private Orange or;
//
//	public Orange getOr() {
//		return or;
//	}
//
//	public void setOr(Orange or) {
//		this.or = or;
//	}
//	
//}



public class GenericsEx1 {

	public static void main(String[] args) {
//		AppleBox aBox = new AppleBox();
//		OrangeBox oBox = new OrangeBox();
//		
//		aBox.setAp(new Apple());
//		oBox.setOr(new Orange());
//		
//		Apple ap = aBox.getAp();
//		System.out.println(ap);
//		Orange op = oBox.getOr();
//		System.out.println(op);
//		
		Box aBox = new Box();
		Box oBox = new Box();
		
		aBox.setObj(new Apple());
		oBox.setObj(new Orange());

		Apple ap = (Apple)aBox.getObj();
		System.out.println(ap);
		
		Orange or = (Orange)oBox.getObj();
		System.out.println(or);
		
		aBox.setObj("orange");
//		Apple ap4 = (Apple)aBox.getObj();
		
		System.out.println(aBox.getObj());
	}

}
