
public class Exercise06_21 {
	
	public static void main(String[] args) {

			MyTv tv = new MyTv();
	
			System.out.println(tv.isPowerOn);
			tv.turnOnOff();
			System.out.println(tv.isPowerOn);
			
			tv.channel=14;
			tv.channelUp();
			System.out.println(tv.channel);
			
			
	}

}

class MyTv {
	boolean isPowerOn;
	
	int channel;
	int volume;
	
	final int MAX_CHANNEL = 100;
	final int MIN_CHANNEL = 0;
	final int MAX_VOLUME = 100;
	final int MIN_VOLUME = 0;
	
	
	void channelUp() { 
		if(MIN_CHANNEL<=channel && channel<=MAX_CHANNEL)
			channel++ ;
		}
	void channelDown() {
		if(MIN_CHANNEL<=channel && channel<=MAX_CHANNEL)
			channel-- ;
		}
	void volumeUp() { 
		if(MIN_VOLUME<=volume&& volume<=MAX_VOLUME)
			volume++ ;
		}
	void volumeDown() {
		if(MIN_VOLUME<=volume&& volume<=MAX_VOLUME)
			volume--; 
		}
	void turnOnOff() {isPowerOn = !isPowerOn;}
	
}

