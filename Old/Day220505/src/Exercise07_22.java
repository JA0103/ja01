abstract class Shape{
	Point p;
	
	Shape(){
		this(new Point(0,0));
	}
	
	Shape(Point p){
		this.p = p;
	}
	
	abstract double calcArea();
	
	Point getPosition() {
		return p;
	}
	
	void setPosition(Point p ) {
		this.p = p;
	}
}

class Point{
	int x;
	int y;
	
	Point (){
		this(0,0);
	}
	
	Point(int x, int y){
		this.x = x;
		this.y = y;
	}
	
	public String toString() {
		return "["+x+","+y+"]";
	}
	
}



public class Exercise07_22 {

	public static void main(String[] args) {
		
	}

}
