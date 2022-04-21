import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

public class Ex06 {

	public static void main(String[] args) {
		//전체가 중복 없게 
	
		Random rand = new Random();
		Scanner sc = new Scanner(System.in);
		
		System.out.println(">>");
		int n = sc.nextInt();
		int arr[] = new int [n]; // 입력한 수 만큼 칸 생성
		
		
		for(int i =0; i<arr.length;i++) {
			int j;
			do {
				j=0;
				arr[i]= rand.nextInt(n+1); //+1 부터 n(입력한 수)까지의 수가 나온다.
				
					for(;j<i;j++) {
						if(arr[j]==arr[i])
							break;
					}
				
			}while(j<i);
		}
		System.out.println(Arrays.toString(arr));
	}//

}
