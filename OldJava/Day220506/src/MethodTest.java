import java.util.Arrays;

public class MethodTest {

	public static void main(String[] args) {
		String str = "hello";
		
		char ch = str.charAt(4);
		System.out.println(ch);
		
		String str2 = "World";
		System.out.println(str.concat(str2));
		
		boolean b = str.contains("heo");
		System.out.println(b);
		
		String animal = "dog,cat,bear";
		String [] ani = animal.split(",");
		System.out.println(Arrays.toString(ani));
		
		
		
	
	}

}
