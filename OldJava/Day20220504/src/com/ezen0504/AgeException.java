package com.ezen0504;

import java.util.Scanner;

class ReadAgeEception extends Exception{
	public ReadAgeEception() {
		super("유효하지 않은 나이가 입력됐습니다.");
	}
}

public class AgeException {

	public static void main(String[] args) {
		
		System.out.println("나이 입력 : ");
		
		try {
			int age = readAge();
			System.out.println("입력된 나이 : "+age);
		}catch(ReadAgeEception e) {
			System.out.println(e.getMessage());
		}
	}

	private static int readAge() throws ReadAgeEception {
		Scanner sc = new Scanner(System.in);
		int age = sc.nextInt();
		
		if(age<0)
			throw new ReadAgeEception();
		return age;
	}

}
