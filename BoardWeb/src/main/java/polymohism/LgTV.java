package polymohism;

public class LgTV implements TV{
	private Speaker speaker;
	private int price;
	
	public LgTV(Speaker speaker, int price) {
		System.out.println("LgTv 객체 생성(2)");
		this.speaker = speaker;
		this.price = price;
	}
	
	public LgTV() {
		System.out.println("LgTV 생성자(디폴트)");
	}
	public void powerOn() {
		System.out.printf("LgTv---전원켠다. (가격 : %d)\n",price);
	}
	public void powerOff() {
		System.out.println("LgTv---전원끈다.");
	}
	public void volumeUp() {
		speaker.volumeUp();
	}
	public void volumeDown() {
		speaker.volumeDown();
	}
}
