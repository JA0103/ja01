package com.ezen0504;

import java.util.HashSet; //set 은 중복 데이터가 들어갈 수 없다.

public class HashSetEqualTest {

	public static void main(String[] args) {
		HashSet<Num> set = new HashSet<>();
		
		set.add(new Num(100));
		set.add(new Num(200));
		set.add(new Num(300));
		set.add(new Num(100));
		set.add(new Num(500));

		
		for(Num n : set)
			System.out.println(n.toString());
	}

}


class Num {
	private int num;
	public Num(int n) {
		num=n;
	}
	
	@Override
	public int hashCode() {
		System.out.println("hashCode");
		return num;
	}
	
	@Override
	public boolean equals(Object obj) {
		System.out.println("equals");
		return num == ((Num)obj).num;
	}
	
	@Override
	public String toString() {
		return String.valueOf(num);  
	}
}