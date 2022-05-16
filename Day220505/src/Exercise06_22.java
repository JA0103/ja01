
public class Exercise06_22 {

	static boolean isNumber(String str) {
		if(str==null || str =="")
			return false;
		
		for(int i=0; i<str.length();i++) {
			char ch = str.charAt(i);
			
			if(ch<'0' || ch>'9')
			
				return false;
		}
		
		return true;
		
	}
	
	public static void main(String[] args) {

		String str = "123vsag231";
		
		System.out.println(isNumber(str));
	}

}
