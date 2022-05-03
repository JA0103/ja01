package LGSamsung;

public class SamsungTv implements Tv{

	@Override
	public void powerOn() {
		System.out.println("sam..On");
	}

	@Override
	public void powerDown() {
		System.out.println("sam..Off");
	}

	@Override
	public void volumeUP() {
		System.out.println("samval...On");
	}

	@Override
	public void volumeDown() {
		System.out.println("samval...Off");
	}
	
	
}
