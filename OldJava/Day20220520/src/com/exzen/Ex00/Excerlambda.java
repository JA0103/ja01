package com.exzen.Ex00;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;



public class Excerlambda {

	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		
		list.add("robottt");
		list.add("apple");
		list.add("toy");
		

		Collections.sort(list);
		System.out.println(list);

		
		List<String> list2 = new ArrayList<String>();
		list2.add("aababab");
		list2.add("efefefeff");
		list2.add("cdcdcdcdcdcdc");
		
		Comparator<String> com = new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.length() - o2.length();
			}
			
		};
		
		Collections.sort(list2,com);
		System.out.println(list2);
		
	}

}