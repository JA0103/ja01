
public class Ex01 {

	public static void main(String[] args) {

	Circle c = new Circle(new Point(10,10),5);
	System.out.println(c.calcArea());
	System.out.println(c.getPosition());
	
		
	}

}

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

class Circle extends Shape{
	double r;
	
	Circle(){}

	Circle(Point p ,double r){
		super(new Point(0,0));
		this.r = r;
	}

	@Override
	double calcArea() {
		
		return r*r*Math.PI;
	}
	
	Point getPosition() {
		return p;
	}
	
//	void Point setPosition(Point p) {
//		this.p;
//	}
	
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