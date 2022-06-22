package polymohism;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component("samsung")
public class SamsungTV implements TV{
	@Resource(name="apple")
	private Speaker speaker;
//	private int price;
	
//	public void setSpeaker(Speaker speaker) {
//		System.out.println("setSpeaker 호출");
//		this.speaker = speaker;
//	}
//	public void setPrice(int price) {
//		System.out.println("setPrice 호출");
//		this.price = price;
//	}
////	
	public SamsungTV(Speaker speaker) {
		System.out.println("samsungTV 객체 생성(1)");
		this.speaker = speaker;
	}
//	public SamsungTV(Speaker speaker,double price) {
//		System.out.println("samsungTV 객체 생성(2)");
//		this.speaker = speaker;
//		this.price = price;
//	}
//	
//	void initMethod() {
//		System.out.println("initMethod 초기화 메소드");
//	}
//	void destroyMethod() {
//		System.out.println("destroyMethod 초기화 메소드");
//	}
	
	public SamsungTV() {
		System.out.println("samsungTV 객체생성(디폴트) ");
	}
	public void powerOn() {
		System.out.printf("SamsungTV---전원켠다.");
	}
	public void powerOff() {
		System.out.println("SamsungTV---전원끈다.");
	}
	public void volumeUp() {
//		speaker = new SonySpeaker();
		speaker.volumeUp();
	}
	public void volumeDown() {
//		speaker = new SonySpeaker();
		speaker.volumeDown();
	}
}
