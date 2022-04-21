import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		
		int a,b;
		
		a=30000;
		b=20;
		
		short c= (short)a; //강제형변환
		
		System.out.println(c);
		
		int cc; //4
		
		
		short dd = 30000;  //2
		
		//연산시에는 자료형이 일치해야한다.
		
		cc = dd;  //자동형변환  dd 2byte를 4byte로 변환한다음 대입
		
	
		System.out.println(cc);
		
		
		int x = 10;
		int y = 20;
		
		System.out.println("before x : " + x);
		System.out.println("before y : " + y);
		
		
		//
		
		int tmp;
		
		tmp = x;
		x = y;
		y = tmp;
		
		//
		
		System.out.println("after x : " + x);
		System.out.println("after y : " + y);

		
		
		//'A', '1' ==> 문자(char)  ,  "ABC" => 문자열 (String)
		// '' -> 사이에는 문자 1개


		boolean g = true;
		boolean h = false; 
		
		char j = 'k';
		//char jj = 'kk';
		
		float f = 10.2f;
		double fd = 10.5;
		
		
		int oct = 010;     //8진수
		int de = 10;       //10진수
		int hex = 0x10;    //16진수
		int bin = 0b1010;  //2진수
		
	
		System.out.println(oct); 
		System.out.println(de);
		System.out.println(hex);
		System.out.println(bin);
		System.out.println("---------------------");
		System.out.println(Integer.toBinaryString(bin));
		System.out.println(Integer.toHexString(hex));
		System.out.println(Integer.toOctalString(oct));
		
		
		//이름 , 나이 출력
		
		int age = 20;
	
		String name;
		
		Scanner sc = new Scanner(System.in); 
		name = sc.nextLine();
				
		System.out.printf("name : %s, age : %d\n", name, age);
		System.out.println("name : " + name + ", age : " + age);
				
				

				
		
				
				
			
	}
	

}
