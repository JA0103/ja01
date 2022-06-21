import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
class Tv {
	private boolean power;  //전원상태 on/off
	private int channel;    //채널
	
	void power() { power = !power; }
	void channelUp() { ++channel; }
	void channelDown() { --channel; }
	
}

@Getter
@Setter
class CaptionTv extends Tv {
	private boolean caption;     //캡션 상태
	void displayCaption (String text) {
		if(caption) {     //캡션이 on(true)일 때만 text를 보여준다.
			System.out.println(text);
		}
	}
	
}

public class CaptionTvTest {

	public static void main(String[] args) {
		CaptionTv ctv = new CaptionTv();
		ctv.setChannel(10);        				 //조상클래스로부터 상속받은 멤버
		ctv.channelUp();					   	//조상클래스로부터 상속받은 멤버	
		System.out.println(ctv.getChannel());
		
		ctv.displayCaption("Hello, World");
		ctv.setCaption(true);   				//캡션기능 on(true)
		ctv.displayCaption("Hello, World"); 	//캡션을 화면에 보여준다
	}

}
