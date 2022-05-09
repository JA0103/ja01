package com.ezen0504;

import java.util.InputMismatchException;
import java.util.Scanner;

public class ExTest01 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		System.out.println("정수 입력 :");
		
		
		
		int sum=0;
		
		try {
			int num = sc.nextInt();
			int a =10/num;
			
		}catch(Exception e) {	// 에러 발생 알 수 있음
//		}catch(InputMismatchException e) {
//			e.printStackTrace();
//		}catch(Exception e) {
			e.printStackTrace();
		}finally{ //  예외가 발생하던 안하던 해주는 (ex).close
			
		}
		
		
		for(int i=0; i<=100;i++)
			sum += i;
		System.out.println("sum : "+ sum);
		
		
	}

}
