package com.springbook.biz.common;

public class LogAdvice {
	public void beforeLog() {
		System.out.println("[공통로그] 비지니스 로직 수행 전 동작 ");
	}
	public void afterLog() {
		System.out.println("[공통로그] 비지니스 로직 수행 후 동작 ");
	}
}
