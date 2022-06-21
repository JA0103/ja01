package LGSamsung;

public class LGTv implements Tv {
	
	@Override
	public void powerOn() {
		System.out.println("Lg..On");
	}

	@Override
	public void powerDown() {
		System.out.println("Lg..Off");
	}

	@Override
	public void volumeUP() {
		System.out.println("Lgval...On");
	}

	@Override
	public void volumeDown() {
		System.out.println("Lgval...Off");
	}
}
