class Variables{
	int iv;  // 인스턴스변수, 멤버변수   ---> 개별적
	static int cv;   //클래스변수, 정적변수, 공유변수   -->  값을 공유
	
	void method() {
		int lv=0;   //지역변수
		
	}
}

public class TestVariable {

	public static void main(String[] args) {
		
		Variables var = new Variables();
		var.iv++;
		Variables.cv++;   //클래스변수인지 인스턴트인지 알기 쉽기 위해 앞에 클래스 이름으로 붙이기
		System.out.println("var : " + var.iv);   //1
		System.out.println("var_cv : " + var.cv);   //1
		
		Variables var2 = new Variables();
		var2.iv++;
		Variables.cv++;
		System.out.println("var2 : " + var2.iv);  //1
		System.out.println("var_cv : " + var.cv);   //-->2로 증가
		
		Variables var3 = new Variables();
		var3.iv++;
		Variables.cv++;
		System.out.println("var2 : " + var3.iv);  //1
		System.out.println("var_cv : " + var.cv);   //-->2로 증가
		
		System.out.println("-------------------------");
		
		Variables var4 = new Variables();
		System.out.println(var4.iv);  //인스턴스변수는 객체 생성 후 사용해야한다.
		
		System.out.println(Variables.cv);  //클래스 변수는 객체 생성하지 않고 접근 가능
										//이유는 객체생성 전에 메모리 공간 올라가있음
	}

}