
class MemberCall {
	
	int iv = 10;
	static int cv = 20;
	
	int iv2 = cv;
	//static int cv2 = iv;    //클래스변수는 인스턴스 변수를 사용할 수 없음
	static int cv2 = new MemberCall().iv;  //이처럼 객체를 생성해야 사용 가능
	
	static void staticMethod1() {   //객체 생성 전 메모리 상주
		System.out.println(cv);
	//	System.out.println(iv);  //클래스 메서드에서 인스턴스변수 사용 불가
		MemberCall c = new MemberCall();
		System.out.println(c.iv);  //객체를 생성한 후 인스턴스변수의 참조 가능
		
	}
	
	void instanveMethod1() {
		System.out.println(cv);
		System.out.println(iv);   ///인스턴스메서드에서는 인스턴스변수 바로 사용가능
	}

	static void staticMethod2() {
		staticMethod1();
		//instanceMethod1();
		MemberCall c = new MemberCall();
		c.instanveMethod1();
	}
	
	void instanceMethod2() {
		staticMethod1();
		instanveMethod1();
	}
}