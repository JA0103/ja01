import java.util.Arrays;
import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {   
		
	//������ �迭 5�� ���� , �ʱ�ȭ�� �����Լ� ���ؼ� 1~100 ���̰��� ���� �� ���
		
		int[] num = new int[5];
		
		for(int i=0;i<num.length;i++){
			num[i]= (int)(Math.random()*99)+1;
			
		}
		System.out.println(Arrays.toString(num));
		
		//�ִ밪 �� �ּҰ� ��� �� ���
		int max=num[0];
		int min=num[0];
		
		for(int i = 0; i<num.length;i++) {
			
			//�ִ밪
			if(max< num[i])
				max = num[i];
			
			//�ּҰ�
			
			if(min> num[i])
				min = num[i];
		}
		System.out.println("max : " + max);
		System.out.println("min : "+min);
		
		
		//sort(����)
		
		
		
		
	}
	
	
}
