package polymohism;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component("lg")
public class LgTV implements TV{
//	@Autowired
//	@Qualifier("apple")
	@Resource(name="sony")
	private Speaker speaker;
//	private int price;
	
	public LgTV(Speaker speaker) {
		System.out.println("LgTv 객체 생성(2)");
		this.speaker = speaker;
//		this.price = price;
	}
	
	public LgTV() {
		System.out.println("LgTV 생성자(디폴트)");
	}
	public void powerOn() {
		System.out.printf("LgTv---전원켠다.");
	}
	public void powerOff() {
		System.out.println("LgTv---전원끈다.");
	}
	public void volumeUp() {
//		System.out.println("소리올린다");
		speaker.volumeUp();
	}
	public void volumeDown() {
//		System.out.println("소리내린다");
		speaker.volumeDown();
	}
}
