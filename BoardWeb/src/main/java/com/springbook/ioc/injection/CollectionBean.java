package com.springbook.ioc.injection;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class CollectionBean {
	private List<String> addressList;
	private Set<String> addressSet;
	private Map<String, String> addressMap;
	private Properties addressPro;
	

	
	public Properties getAddressPro() {
		return addressPro;
	}

	public void setAddressPro(Properties addressPro) {
		this.addressPro = addressPro;
	}

	public Map<String, String> getAddressMap() {
		return addressMap;
	}

	public void setAddressMap(Map<String, String> addressMap) {
		this.addressMap = addressMap;
	}

	public Set<String> getAddressSet() {
		return addressSet;
	}

	public void setAddressSet(Set<String> addressSet) {
		this.addressSet = addressSet;
	}


	public CollectionBean() {
		System.out.println("CollectionBean 호출");
	}
	
	public List<String> getAddressList() {
		System.out.println("getAddress");
		return addressList;
	}

	public void setAddressList(List<String> addressList) {
		System.out.println("setAddress");
		this.addressList = addressList;
	}
	
	
	
}
