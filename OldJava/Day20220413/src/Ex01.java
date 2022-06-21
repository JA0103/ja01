import java.util.Arrays;
import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {   
		
	//정수형 배열 5개 선언 , 초기화는 랜덤함수 통해서 1~100 사이값을 저장 및 출력
		
		int[] num = new int[5];
		
		for(int i=0;i<num.length;i++){
			num[i]= (int)(Math.random()*99)+1;
			
		}
		System.out.println(Arrays.toString(num));
		
		//최대값 및 최소값 계산 및 출력
		int max=0;
		int min = num[0];
		
		for(int i = 0; i<num.length;i++) {
			
			//최대값
			if(max< num[i])
				max = num[i];
			
			if(min > num[i]) 
				min = num[i];
		}
		System.out.println("max : " + max);
		System.out.println("min : " +min);
		
		//Sort(정렬)
		
		for(int i=0; i<num.length-1;i++) {
			for(int j=num[i]; j<num.length-1-i;j++) {
				
				int k = num[i+1]; 
				if(num[i]>=k) {
					int tmp= num[i]; 
					num[i]=k;
					k =tmp;
				}
			}
		}
		System.out.println(Arrays.toString(num));
			
		
		
		
		
		}
	
	
}
