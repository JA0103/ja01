import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

interface Printable{
	void print();
	
}

class Papers{
	private String con;
	public Papers(String s) {con = s;}
	public Printable getPrinter() {return new Printer2();}
	
	private class Printer implements Printable{
		public void print() {
			System.out.println("흑백 : " +con);
		}
	}
	private class Printer2 implements Printable{
		public void print() {
			System.out.println("컬러 : " +con);
		}
	}
}

public class UsememberEx1 {

	public static void main(String[] args) {
		Papers p = new Papers("message");
		Printable prn = p.getPrinter();
		prn.print();
		
		List<String> list = new ArrayList<>();
		list.add("aaaaaaa");
		list.add("bbbb");
		list.add("ccccc");
		
		Iterator<String> it = list.iterator();
		
		while(it.hasNext()) {System.out.println(it.next());}
		
		
	}

}
