import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		
		int a,b;
		
		a=30000;
		b=20;
		
		short c= (short)a; //��������ȯ
		
		System.out.println(c);
		
		int cc; //4
		
		
		short dd = 30000;  //2
		
		//����ÿ��� �ڷ����� ��ġ�ؾ��Ѵ�.
		
		cc = dd;  //�ڵ�����ȯ  dd 2byte�� 4byte�� ��ȯ�Ѵ��� ����
		
	
		System.out.println(cc);
		
		
		int x = 10;
		int y = 20;
		
		System.out.println("before x : " + x);
		System.out.println("before y : " + y);
		
		
		//
		
		int tmp;
		
		tmp = x;
		x = y;
		y = tmp;
		
		//
		
		System.out.println("after x : " + x);
		System.out.println("after y : " + y);

		
		
		//'A', '1' ==> ����(char)  ,  "ABC" => ���ڿ� (String)
		// '' -> ���̿��� ���� 1��


		boolean g = true;
		boolean h = false; 
		
		char j = 'k';
		//char jj = 'kk';
		
		float f = 10.2f;
		double fd = 10.5;
		
		
		int oct = 010;     //8����
		int de = 10;       //10����
		int hex = 0x10;    //16����
		int bin = 0b1010;  //2����
		
	
		System.out.println(oct); 
		System.out.println(de);
		System.out.println(hex);
		System.out.println(bin);
		System.out.println("---------------------");
		System.out.println(Integer.toBinaryString(bin));
		System.out.println(Integer.toHexString(hex));
		System.out.println(Integer.toOctalString(oct));
		
		
		//�̸� , ���� ���
		
		int age = 20;
	
		String name;
		
		Scanner sc = new Scanner(System.in); 
		name = sc.nextLine();
				
		System.out.printf("name : %s, age : %d\n", name, age);
		System.out.println("name : " + name + ", age : " + age);
				
				

				
		
				
				
			
	}
	

}
