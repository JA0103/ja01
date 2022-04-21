import java.util.Scanner;

public class IfSort {

	public static void main(String[] args) {

	Scanner sc = new Scanner(System.in);
			//세 정수를 입력 받아 최대 중간 최소 값 순서로 출력
			int max = sc.nextInt();
			int med = sc.nextInt();
			int min = sc.nextInt();
			
			if(max<med) {
				int tmp = max;
				max= med;
				med = tmp;
			}
			
			if(max<min) {
				int tmp = max;
				max = min;
				min = tmp;
			}
			
			if(med<min) {
				int tmp = min;
				min = med;
				med = tmp;
			}
			
			System.out.println("최대 :"+max+" 중간 : "+med+" 최소 : "+min);
//				
//			
//			
//			//강사님 버전
//			Scanner sc = new Scanner(System.in);
//			
//			int num1 = sc.nextInt();
//			int num2 = sc.nextInt();
//			int num3 = sc.nextInt();
//			int max, min, med;
//			max=min=med=0;
//			
//			if(num2>num1) {
//				if(num2>num3) {
//					max = num2;
//					if(num1 > num2) {
//						med = num1;
//						min = num3;
//					}
//				}
//				else {
//					max = num3;
//					med = num2;
//					min = num1;
//				}
//			}else if (num3>num1) {
//				max = num3;
//				med = num1;
//				min = num2;
//			}else {
//				if(num2>num3) {
//					max = num1;
//					med = num2;
//					min = num3;
//				}else {
//					max = num1;
//					med = num3;
//					min = num2;
//				}
//			}
//			
//			System.out.printf("max :%d , med : %d , min : %d %n",max ,med, min);
	}//class end.

}
