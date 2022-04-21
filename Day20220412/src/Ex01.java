
public class Ex01 {

	public static void main(String[] args) {
		//함수에서 입력(O), 출력(O)
		
		
		System.out.println("main()함수!!");

		int result = sub(5,10); //함수 호출  ------->인자값
		 
		System.out.println("결과 값은 "+result);
	}

	public static int sub(int x, int y) { //--------->매개변수
		
		int num = x*y;

		System.out.println("sub() 함수...");
		
		return num;
	}


}
