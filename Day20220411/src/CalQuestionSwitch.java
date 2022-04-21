import java.util.Scanner;

public class CalQuestionSwitch {

	public static void main(String[] args) {

		int sum = 0;
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.println("�����Է�(����:0)) : ");
			String tmp = sc.nextLine();
			int num = Integer.parseInt(tmp);
			if (num==0) break;
			
			System.out.println("��Ģ���� ��ȣ : ");
			String str = sc.nextLine();
			char ch = str.charAt(0);
			
			switch (ch) {
			case '+' :
				sum+=num;
				break;
			case '-' :
				sum-=num;
				break;
			case '*' :
				sum*=num;
				break;
			case '/' :
				sum/=num;
				break;
				default :
					System.out.println("+ - * / �߿� �ϳ��� �Է��ϼ���");
			}
		}
		System.out.println(sum);
	}//main�� ��

}
