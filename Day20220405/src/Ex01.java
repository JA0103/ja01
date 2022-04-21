import java.util.Scanner;


public class Ex01 {

	public static void main(String[] args) {

		float pi = 3.14159f;    

		//3.141
		
		float result = (int)(pi*1000)/ 1000f;
		
		
		System.out.println(result);
		

		//3.142
		
		float result2 = (int)(pi*1000+0.5f) / 1000f;
		
		System.out.println(result2);
		
		
		//----------------------------
		
		double pi2 = 3.141592;
		 double shortPi = Math.round(pi2 * 1000)/1000.0;
		                  
		 System.out.println(shortPi);
			
		 
		 //----------------------------------
		 
		 int x = 10;
		 int y = 8;
		 
		 
		 
		 System.out.println(x > y);   
		 System.out.println(x < y);    
		 System.out.println(x <= y);    
		 System.out.println(x >= y);    

		 System.out.println(x == y);    
		 System.out.println(x != y);    
		 
		 
		 //-----------------------------
		 
		 String str1= "abc";
		 //클래스는 객체(?)를 생성해야한다. new 연산자료 생성
		 String str2 = new String("abc");

		 
		 System.out.println("aaa: " + (str1 == str2));
		 
		 
		 
		 System.out.printf("\"abc\" == \"abc\" ? %b%n", "abc" == "abc");

		 

		 System.out.printf("str1 ==\"abc\" ? %b%n", str1 == "abc");
		 System.out.printf("str2 ==\"abc\" ? %b%n", str2 == "abc");
		
		 
		 System.out.printf("str1.equals(\"abc\") ? %b%n", str1.equals("abc"));
		 System.out.printf("str2.equals(\"abc\") ? %b%n", str2.equals("abc"));
		 System.out.printf("str2.equals(\"ABC\") ? %b%n", str2.equals("ABC"));
		 System.out.printf("str2.equalsIgnoreCase(\"ABC\") ? %b%n", 
		 str2.equalsIgnoreCase("ABC"));
		 System.out.printf("str1.equals(str2) ? %b%n", str1.equals(str2));
		 
		 
		 
		 int a = 1; 
		 int b = 0;
		 int i = 20;
		 
		 System.out.println(a>0 && b>=0);
		 System.out.println(a>0 || b>0);


		System.out.println( i%2 == 0 || (i%3 == 0 && i%6 != 0));
		System.out.println( i%3 == 0 && i%6 != 0);
		
		char ch = 'a';
		
		System.out.println( ('a'<=ch && ch <= 'z')  ||  ('A' <=ch && ch <= 'Z'));
		                    //97 ~122               ||       65~ 90
		
		 
		 
		
	}

}
