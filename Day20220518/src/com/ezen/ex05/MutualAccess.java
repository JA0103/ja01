package com.ezen.ex05;

class Counter{
	int count =0;
	
	public void increment() {
		synchronized(this) {count++;}  //동기화 블럭
		
		System.out.println("111");
		System.out.println("111");
		System.out.println("111");
	}
	synchronized public void decrement() {count--;}
	public int getcount() { return count; }
}

public class MutualAccess {

	public static Counter cnt = new Counter();
	
	public static void main(String[] args) throws Exception {
		Runnable task1 = () -> {  //Runnable 구현한 인스턴스 생성
			for(int i=0; i<100; i++) {
				cnt.increment();
			}
		};

		Runnable task2 = () -> {
			for(int i=0; i<100; i++) {
				cnt.decrement();
			}
		};
		
		Thread t1 = new Thread(task1);  //Thread 인스턴스 생성
		Thread t2 = new Thread(task2);  //Thread 인스턴스 생성
		
		t1.start();
		t2.start();
		t1.join();  //t1이 참조하는 쓰레드 종료까지 대기
		t2.join();
		
		System.out.println(cnt.getcount());
		
		
	}//main

}
