import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {

	int num1=0;
	int sum=0;
	String cal;
	
	
	Scanner sc = new Scanner(System.in);

	
	while (true) {
		System.out.print("연산자 : ");
		cal = sc.next();
		System.out.print("정수 : " );
		num1 = sc.nextInt();
		
		if (cal.equals("+")) {
			sum+=num1;
			System.out.println("sum : " + sum);
		} else if (cal.equals("*")) {
			sum*=num1;
			System.out.println("sum : " + sum);
		} else if (cal.equals("/")) {
			sum/=num1;
			System.out.println("sum : " + sum);
		} else if (cal.equals("-")) {
			sum-=num1;
			System.out.println("sum : " + sum);
		}
	}
	
		
	}//main의 끝

}












