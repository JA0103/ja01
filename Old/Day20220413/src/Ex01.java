import java.util.Arrays;
import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {   
		
	//������ �迭 5�� ���� , �ʱ�ȭ�� �����Լ� ���ؼ� 1~100 ���̰��� ���� �� ���
		
		int[] num = new int[5];
		
		for(int i=0;i<num.length;i++){
			num[i]= (int)(Math.random()*99)+1;
			
		}
		System.out.println(Arrays.toString(num));
		
		//�ִ밪 �� �ּҰ� ��� �� ���
		int max=0;
		int min = num[0];
		
		for(int i = 0; i<num.length;i++) {
			
			//�ִ밪
			if(max< num[i])
				max = num[i];
			
			if(min > num[i]) 
				min = num[i];
		}
		System.out.println("max : " + max);
		System.out.println("min : " +min);
		
		//Sort(����)
		
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
