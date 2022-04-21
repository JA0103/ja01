
public class ArrayEqualX{

	public static void main(String[] args) {
		//두 배열 요소가 같으면 true, 틀리면 false
		int[] nArr1 = {10,20,30,40,50};
		int[] nArr2 = {10,20,30,40,50};
		
		boolean check = ArrayEqual(nArr1, nArr2);
		
		System.out.println(check);
	}

	//두 배열 비교는 여기서
	static boolean ArrayEqual(int[] n1, int[] n2) {
		
		
	//+
		if(n1.length != n2.length)
			return false;
		
		for(int i=0; i<n1.length;i++)
			if(n1[i] != n2[i]) 
				return false; 
		
		return true;
		
		
		
	}//ArrayEqual
	
	
	
	
}
