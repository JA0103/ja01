package polymohism;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TVUser {

	public static void main(String[] args) {
		
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		//파일 시스템이나 클래스 경로에 있는 XML설정 파일을 로딩하여 구동하는 컨테이너이다.
		
		
		TV tv = (TV)factory.getBean("samsung");
//		TV tv2 = (TV)factory.getBean("tv");	//scope="prototype"을 해주면 따로 쓸 수 있음
//		TV tv = factory.getBean("tv2", LgTV.class);
		
		tv.powerOn();
		tv.volumeUp();
		tv.volumeDown();
		tv.powerOff();
		
		factory.close();
	}

}
