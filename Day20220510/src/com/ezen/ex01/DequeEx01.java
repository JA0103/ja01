package com.ezen.ex01;

import java.util.ArrayDeque;
import java.util.Deque;

/*
 * (앞)
 * addFirst() 넣기
 * removeFirst 꺼내기
 * getFirst() 확인하기
 * 
 * (뒤)
 * addLast 넣기 
 * removeLast 꺼내기
 * getLast
 */



public class DequeEx01 {

	public static void main(String[] args) {
		
		Deque<String> deq = new ArrayDeque<String>();
		
		deq.offerFirst("1.box");
		deq.offerFirst("2.toy");
		deq.offerFirst("3.robot");
		
		//스택구조(Last in First out)
		System.out.println(deq.pollFirst());
		System.out.println(deq.pollFirst());
		System.out.println(deq.pollFirst());
		
		//큐 구조(First in First out)
//		System.out.println(deq.pollLast());
//		System.out.println(deq.pollLast());
//		System.out.println(deq.pollLast());
	}

}
