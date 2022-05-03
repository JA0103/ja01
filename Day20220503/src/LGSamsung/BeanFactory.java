package LGSamsung;


public class BeanFactory {
	
	public Object getBean(String beanName) {
		
		if(beanName.equals("Samsung")){
			return new SamsungTv();
		}else if(beanName.equals("LGTv")){
			return new LGTv();
		}
		return null;
	}
}
