import java.util.Scanner;

public class Student {

	public static void main(String[] args) {
//5명 학생 두 과목(영어, 수학)을 입력 받아서 과목별 평균, 학생별 평균을 구하는 프로그램
		
		Scanner sc = new Scanner(System.in);
		
		int num = 5;  //학생 수
		
		int[][] sub = new int[num][2];   //점수
		int[] totalStudent = new int [num]; //학생별 점수
		int[] totalsub = new int[2]; //과목 점수
		
		System.out.printf("%d명 영어, 수학 점수 입력.\n",num);
		
		for(int i=0; i<num;i++) {
			System.out.printf("%d번 영어 : ",i+1);
			sub[i][0]= sc.nextInt();   //영어
			System.out.println("   수학 : ");
			sub[i][1]= sc.nextInt();   //수학
			
			totalStudent[i] = sub[i][0] + sub[i][1]; //학생합계
			totalsub[0] +=sub[i][0]; //영어합계
			totalsub[1] +=sub[i][1]; //수학합계
		}
		
		System.out.println("no.    영어    수학    평균");
		for(int i=0; i<num;i++) 
			System.out.printf("%2d %6d %6d %6.1f\n",i+1,sub[i][0],
					sub[i][1], (double)totalStudent[i]/2);
			
			System.out.printf("평균 %6.1f %6.1f\n",(double)totalsub[0]/num,
												(double)totalsub[1]/num);
		
		
		
		
	}//main

}
