
public class Ex01 {

	public static void main(String[] args) {
		//�Լ����� �Է�(O), ���(O)
		
		
		System.out.println("main()�Լ�!!");

		int result = sub(5,10); //�Լ� ȣ��  ------->���ڰ�
		 
		System.out.println("��� ���� "+result);
	}

	public static int sub(int x, int y) { //--------->�Ű�����
		
		int num = x*y;

		System.out.println("sub() �Լ�...");
		
		return num;
	}


}
