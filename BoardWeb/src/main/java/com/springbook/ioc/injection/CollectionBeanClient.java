package com.springbook.ioc.injection;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {

	public static void main(String[] args) {
		AbstractApplicationContext factory = 
				new GenericXmlApplicationContext("applicationContext.xml");
		
		CollectionBean bean = (CollectionBean)factory.getBean("CollectionBean");
		List<String> list = bean.getAddressList();
		
				for(String str : list)
					System.out.println(str);
				System.out.println("---------------------------");
				
				   
		Set<String> addressSet = bean.getAddressSet();
			      for(String address : addressSet) {
			         System.out.println(address);
			      }
			      System.out.println("---------------------------");
	
		Map<String, String> addressMap = bean.getAddressMap();
			
				for(String address : addressMap.keySet()) {
					System.out.println(address);
				}
				
				System.out.println("--------------=====");
				
				for(String address : addressMap.values()) {
					System.out.println(address);
				}
		
		System.out.println("==========================엔트리");
		Properties addressPro = bean.getAddressPro();
		
		for(Entry<Object, Object> pro : addressPro.entrySet())
			System.out.println(pro);
				
				factory.close();
				
				
				
	}

}
