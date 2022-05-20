package com.exzen.Ex06;

import java.util.function.Consumer;
import java.util.function.ObjDoubleConsumer;
import java.util.function.ObjIntConsumer;

public class ConsumerEx1 {

	public static void main(String[] args) {
		Consumer<String> c = s -> System.out.println(s);
		
		c.accept("consumer!!");
		c.accept("java consumer");
		
		ObjIntConsumer<String> c2 = (s,i) -> System.out.println(i + ", "+ s);
		ObjDoubleConsumer<String> c3 = (s,d) ->System.out.println(d+ ", " + s);
		
		int n =1;
		c2.accept("toy", n++);
		c2.accept("robot", n++);
		c2.accept("box", n++);
		double  d=1.1;
		c3.accept("toy", d++);
		c3.accept("robot", d++);
		c3.accept("box", d++);
	}

}
