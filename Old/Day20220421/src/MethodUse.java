import java.util.Scanner;

public class MethodUse {

	static int num1,num2,num3;//클래스 안에서 다 사용할 수 있는 공용변수,정적변수
	public static void main(String[] args) {//입력
		
		//세 정수 입력 받아 최대값 출력 --> 입력, 계산, 출력 함수 나누기
		
		input();
		
		int max = Cal(num1,num2,num3);
		
		output(max);
		
		
		
	}//main

	static void input(){
		Scanner sc = new Scanner(System.in);
		
		 num1 = sc.nextInt();
		 num2 = sc.nextInt();
		 num3 = sc.nextInt(); 
		
		
		
	}
	
	static int Cal (int num1,int num2, int num3) {
		int max =0;
		
		if(num1>num2 && num1>num3)
			max = num1;
		else if(num2>num1 && num2>num3)
			max = num2;
		else if(num3>num1 && num3>num2)
			max = num3;
		
		
		return max;
		
	}
	
	
	static void output(int max){
		System.out.println(max);
	}
}//class
