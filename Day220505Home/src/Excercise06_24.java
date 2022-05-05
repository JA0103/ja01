import java.util.Arrays;

public class Excercise06_24 {

	static int max(int []arr) {
		int max =0;
		if(arr==null ||arr.length==0) 
			return -999999;
		
		for(int i=1; i< arr.length;i++) {
			if(arr[i]>max) {
				max = arr[0];
				max = arr[i];
			}
		}
		return max;
	}
	
	static int min(int[] data) {
		int min=data[0];
		for(int i=1;i<data.length;i++) {
			if(data[i]<min) {
				min = data[i];
			}
		}
		return min;
	}
	public static void main(String[] args) {
		
		int[] data = {3,5,1,56,3};
		System.out.println("최대값 : "+max(data));
		System.out.println("최소값 : "+min(data));
		System.out.println(Arrays.toString(data));
		System.out.println(max(null));
		System.out.println(max(new int[] {}));
	}

}
