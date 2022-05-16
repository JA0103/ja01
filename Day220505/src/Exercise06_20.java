import java.util.Arrays;



public class Exercise06_20 {

	static int[] shuffle(int[] arr) {
		for(int i=0; i<arr.length;i++) {
			int k = (int)(Math.random()*arr.length);
			int tmp = arr[i];
			arr[i] = arr[k];
			arr[k] = tmp;
		}

		return arr;
	}
	
	public static void main(String[] args) {
		int[] original = {3,5,123,6,9,4,62,};
		System.out.println(Arrays.toString(original));
		
		int[] shuffleArr = shuffle(original);
		System.out.println(Arrays.toString(shuffleArr));
		
	}

}
