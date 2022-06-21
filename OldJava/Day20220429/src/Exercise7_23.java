abstract class Shape {
	Point p;
	
	Shape() {
		this(new Point(0,0));
	}
	
	Shape(Point p) {
		this.p = p;
	}
	
	abstract double calcArea(); // 도형의 면적을 계산해서 반환하는 메서드
		Point getPosition() {
			return p;
	}
		
	void setPosition(Point p) {
		this.p = p;
	}
}

class Point {
	int x;
	int y;
	
	Point() {
		this(0,0);
	}
	
	Point(int x, int y) {
		this.x=x;
		this.y=y;
	}
	
	public String toString() {
		return "["+x+","+y+"]";
	}
}


class Circle extends Shape {
	
	double r;
	Circle(){ this(new Point (0,0),0); }
	
	public Circle (double r){
		//this.r=r;
		this(new Point (0,0),r);
	}
	
	public Circle(Point p, double r){
		super(p);
		this.r=r;
	}
	@Override
	double calcArea() {
		return Math.PI*r*r;
	}
	
}

class Rectangle extends Shape {
	
	double width;
	double height;
	public Rectangle() {this(new Point(0,0),0,0);	}
	
	public Rectangle(double width, double height){
//		this.height = height;
//		this.width = width;
		this(new Point(0,0),width, height);
	}
 
	public Rectangle(Point p, double width, double height) {
		super(p);
		this.width = width;
		this.height = height;
	}

	@Override
	double calcArea() {
		return width *height;
	}
	
	boolean isSquare() {
		return width==height && width*height !=0;
	}
	
}


public class Exercise7_23 {

	public static void main(String[] args) {
		Shape s = new Circle(new Point (10,10),5);
		Shape s3 = new Circle(5);
		System.out.println(s.calcArea());
		System.out.println(s3.calcArea());
		System.out.println(s.getPosition());
		System.out.println(s3.getPosition());
		
		Rectangle r = new Rectangle(new Point(10,10),6,6);
		System.out.println(r.isSquare());
		System.out.println(r.calcArea());
		System.out.println(r.getPosition());
	}

}
