
public class ArrayEqualUse {

	public static void main(String[] args) {
		//두 배열 요소가 같으면 true, 틀리면 false
		int[] nArr1 = {10,20,30,40,50,};
		int[] nArr2 = {10,20,30,40,50,};
		
		System.out.println(java.util.Arrays.toString(nArr1));
		System.out.println(java.util.Arrays.toString(nArr2));
		
		System.out.println(ArrayEual(nArr1, nArr2));
	}

	//두 배열 비교는 여기서
	static boolean ArrayEual(int[] n1, int[] n2) {
		
		
		if(java.util.Arrays.equals(n1, n2)) {
			return true;
		}
		else
			return false;
		
		
	}//ArrayEual
	
	
	
	
}
