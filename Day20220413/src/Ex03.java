
public class Ex03 {

	public static void main(String[] args) {
		char[] abc = { 'A', 'B', 'C', 'D' };
	      System.out.println(abc);
	      
	      char[] num = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
	      System.out.println(num);
	      
	      char[] tmp = new char[20];
	      
	      for(int i=0; i<abc.length; i++)
	         tmp[i] = abc[i];
	      
	      System.out.println(tmp);

	      for(int i=abc.length; i<num.length+abc.length; i++)
	         tmp[i] = num[i-abc.length];
	      
	      System.out.println(tmp);
	}

}
