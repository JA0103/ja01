import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {

		
		//1)
		int x = 11;
		boolean t = (10 < x && x < 20);
		
		System.out.println(t);
		
		//2)
		char ch = ' '; 
		boolean t1 = (' '!=  ch || ch != '\t');
		
		System.out.println(ch);
		
		//3)
		char ch2 = 'x';
		boolean t2 = ('x' == ch2 || ch2 =='X');
				
		System.out.println(t2);
		
		//4)
		char ch3 = '0';
		boolean t3 = ('0' <= ch3 && ch3 <= '9');
		
		System.out.println(t3);
		
		//5)
		char ch4 = 'a';
		boolean t4 = ('a' <= ch4 && ch4 <= 'z') || ('A' <= ch4 && ch4 <= 'Z');
		
		System.out.println(t4);

		//6)
		int year = 431;
		boolean t5 = ((year%400 == 0) || (year%4 == 0 ) && (year%100 != 0));
	
		System.out.println(t5);
		
		//7)
		
		boolean powerOn = false;
		System.out.println(powerOn==false);
		
			
		//8)
		String str = "yes";
		
		System.out.println(str.equals("yes"));
		
	
	
			

				
	}

}
