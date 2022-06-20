package polymohism;

public class LgTV implements TV{
	public LgTV() {
		System.out.println("LgTV 생성자");
	}
	
	public void powerOn() {
		System.out.println("LgTv---전원켠다.");
	}
	public void powerOff() {
		System.out.println("LgTv---전원끈다.");
	}
	public void volumeUp() {
		System.out.println("LgTv---소리올린다.");
	}
	public void volumeDown() {
		System.out.println("LgTv---소리내린다.");
	}
}
