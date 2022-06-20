package polymohism;

public class SamsungTV implements TV{
	public SamsungTV() {
		System.out.println("samsungTV 생성자");
	}
	
	public void powerOn() {
		System.out.println("SamsungTV---전원켠다.");
	}
	public void powerOff() {
		System.out.println("SamsungTV---전원끈다.");
	}
	public void volumeUp() {
		System.out.println("SamsungTV---소리올린다.");
	}
	public void volumeDown() {
		System.out.println("SamsungTV---소리내린다.");
	}
}
