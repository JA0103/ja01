import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {
	
		int input=3;
		
		boolean flag = gugudan(input);
				
				if(flag == true)
					System.out.println("��¼���");
				else
					System.out.println("��½���");
		
	}//main end.
		public static boolean gugudan(int n) {
			
			boolean flag = true;
			
			System.out.println("�Է���"+n+"�� ���");
			for(int i=1; i<=9; i++) {
				System.out.println(n +"x" + i + "=" + n*i);
			
				if (i==9) {
					flag = true;
				} else {
					flag = false;
				}
			}
			return flag;	
			
	}//sub end.

}//class end.
