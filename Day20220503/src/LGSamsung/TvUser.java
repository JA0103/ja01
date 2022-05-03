package LGSamsung;

public class TvUser {
	public static void main(String[] args) {
//		
//		Tv lg = new SamsungTv();
//		lg.powerDown();
//		lg.powerOn();
//		lg.volumeDown();
//		lg.volumeUP();
		
		BeanFactory factory = new BeanFactory();
		Tv tv = (Tv)factory.getBean(args[0]);
		tv.powerDown();
		tv.powerOn();
		tv.volumeDown();
		tv.volumeUP();
		
	}
}
