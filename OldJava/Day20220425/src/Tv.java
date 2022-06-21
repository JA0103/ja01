
public class Tv {
		//변수 == 인스턴스변수
		String color;
		boolean power;  //인스턴스 변수
		int channel;   //채널 번호 저장
		
		//메소드 == 인스턴스메소드
		void power() {
			power = !power;
		}
		
		void chnnelUp()  {
			++channel;
		}
		
		void channelDown () { 
			--channel;
		}
		
}//class Tv.

class TvTest {
	public static void main (String args[]) {
		//tv객체 만들고싶다.  --->객체를 만들려면 클래스(설계도)가 있어야한다.
		Tv t;
		t = new Tv();
		t.channel = 7;
		t.channelDown(); 
		System.out.println("현재 채널은 " + t.channel + "입니다.");
	}
	
}//class TvTest.