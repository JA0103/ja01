package zoo;

//public >> protected(상속 받으면 ok) >> default (같은 패키지 안에서 ok) >> private
public class Cat {
	public void makeCat() {
		Duck quack = new Duck();
	}
}

class Duck{
	
}
