import java.util.Arrays;
import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {   
		
	//정수형 배열 5개 선언 , 초기화는 랜덤함수 통해서 1~100 사이값을 저장 및 출력
		
		int[] num = new int[5];
		
		for(int i=0;i<num.length;i++){
			num[i]= (int)(Math.random()*99)+1;
			
		}
		System.out.println(Arrays.toString(num));
		
		//최대값 및 최소값 계산 및 출력
		int max=num[0];
		int min=num[0];
		
		for(int i = 0; i<num.length;i++) {
			
			//최대값
			if(max< num[i])
				max = num[i];
			
			//최소값
			
			if(min> num[i])
				min = num[i];
		}
		System.out.println("max : " + max);
		System.out.println("min : "+min);
		
		
		//sort(정렬)
		
		
		
		
	}
	
	
}
