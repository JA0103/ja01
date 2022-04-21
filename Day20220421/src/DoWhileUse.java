import java.util.Scanner;

public class DoWhileUse {

	public static void main(String[] args) {
		
		
		Scanner sc = new Scanner(System.in);
		int num =0;
		
		
		do {
			System.out.println("두 자리 정수를 입력하시오");
			
			System.out.println("입력 >>");
			num = sc.nextInt();
			
			
		}while(num<10 || num>99);

		System.out.println(num);
	}//main

}
