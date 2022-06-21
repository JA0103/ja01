package com.exzen.Ex05;

import java.util.Random;

@FunctionalInterface  //함수형 인터페이스 --> 추상 메소드 1개만 존재
interface Generator{
	int rand();
//	int mas();
}

public class Lambda5 {
	
	public static void main(String[] args) {
		
		Generator gen = () -> { 
			Random ran = new Random();
			return ran.nextInt(50);
		};
		
		int num = gen.rand();
		System.out.println(num);
		
	}

}
