package com.ezen0504;
//책 460p
import javax.sound.midi.Receiver;

class Rectangle implements Cloneable{
	private Point2 uppLeft;	//좌측 상단 좌표
	private Point2 lowerright;	//우측 하단 좌표
	
	public Rectangle(int x1, int y1, int x2, int y2) {
		uppLeft = new Point2(x1, y1);
		lowerright = new Point2(x2, y2);
	}
	public void changePos(int x1, int y1, int x2, int y2) { //좌표 수정
		uppLeft.changePos(x1, y1);
		lowerright.changePos(x2, y2);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		Rectangle copy = (Rectangle)super.clone();
		
		copy.uppLeft =(Point2) uppLeft.clone();
		copy.lowerright = (Point2) lowerright.clone();  // --> deep copy
		
		return copy;
	}
	
	
	public void showPosition () {  // 사각형 좌표 출력
		System.out.println("좌측 상단");
		uppLeft.showPosition();
		
		System.out.println("우측 하단");
		lowerright.showPosition();
	}
}


class Point2 implements Cloneable  {
	
	private int xPos;
	private int yPos;
	
	public Point2(int x, int y) {
		xPos = x; yPos=y;
	}
	
	public void changePos(int x, int y) {
		xPos = y;
		yPos = x;
	}
	
	public void showPosition() {
		System.out.printf("[%d, %d]\n", xPos,yPos);
		
	}
	protected Object clone() throws CloneNotSupportedException{
		return super.clone();
	}
		
	
	
}

public class ShallowCopy {
	
		public static void main(String[] args) throws CloneNotSupportedException{
			Rectangle org = new Rectangle(1, 1, 8, 8);
			Rectangle cpy;
			
			cpy =(Rectangle) org.clone();
			org.showPosition();
			cpy.showPosition();
			
			org.changePos(3, 3, 7, 7);
			org.showPosition();
			cpy.showPosition();
			
		}
}
