import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class UseRandomQuestion {

	public static void main(String[] args) {
		//int [] nArr = new int [10]; --> 난수 0~9 를 배열 입력
		// 단, 붙어있는 아이는 중복되면 안된다. 05788 x 05789 o
		
		int[] nArr = new int[10];
		
		for(int i=1;i<nArr.length;i++) {
			do {
				nArr[i] = (int)(Math.random()*10);
				
			}while (nArr[i]==nArr[i-1]);
			
		}
						
					
		
		System.out.println("문제1-1 : "+Arrays.toString(nArr));
		
		
		
		System.out.println("=============================");
		//  == UseRandom
		
		
		
		Random rand = new Random();
		Scanner sc = new Scanner(System.in);
		
		System.out.println("배열 갯수 입력 : ");
		
		int n = sc.nextInt();
		int[] nArr1 = new int[n];  //입력한 수 만큼 공간 생성
		
		nArr[0]= rand.nextInt(10);  //0~9까지 랜덤
		
		for(int i=1; i<nArr1.length;i++) {
			
			do {
				nArr1[i] = rand.nextInt(10);
				
			}while(nArr1[i] == nArr1[i-1]);
		}
		System.out.println("문제1-2 : "+Arrays.toString(nArr1));
		
		
		System.out.println("=============================");
		//이번엔 전체가 중복 안되게
		System.out.println("배열 갯수 입력 : ");
		
		int n1 = sc.nextInt();
		int[] nArr2 = new int[n1];  //입력한 수 만큼 공간 생성
		
		nArr[0]= rand.nextInt(10);  //0~9까지 랜덤
		
		for(int i=1; i<nArr2.length;i++) {
			int j;
			do {
				j=0;
				nArr2[i] = rand.nextInt(10);
				
				for(;j<i;j++)
					if(nArr2[j]==nArr2[i])
						break;
			}while(j<i);
		}
		System.out.println("문제2 : "+Arrays.toString(nArr2));
		
		
		
		
		
		
		
	}//main

}
