package com.ezen01;

import java.util.Arrays;
import java.util.StringTokenizer;

public class StringTokenizerEx1 {

	public static void main(String[] args) {
		String source = "100,200,300,400";
		StringTokenizer st = new StringTokenizer(source,",");
		
		while(st.hasMoreElements()) {
			System.out.println(st.nextToken());
		}

		String str[] = source.split(",");
		System.out.println(Arrays.toString(str));
		
	}
	

}
