import java.util.Scanner;

public class Ex02 {

	public static void main(String[] args) {

		int x = 0xAB, y = 0xF;
		
		System.out.printf(" x = %#X \t\t%s%n", x, toBinaryString(x));
		System.out.printf(" y = %#X \t\t%s%n", y, toBinaryString(y));
		System.out.printf(" %#X | %#X = %#X  \t\t%s%n", x, y, x | y, 
				toBinaryString(x|y));
		System.out.printf("%#X & %#X = %#X \t\t%s%n", x,y,x & y,
				toBinaryString(x&y));
		System.out.printf("%#X ^ %#X = %#X \t\t%s%n", x,y, x ^ y, 
				toBinaryString(x^y));
		System.out.printf(" %#X ^ %#X^ &#X = %#X \t\t%s%n", x, y, x ^ y ^ y,
				toBinaryString(x^y^y));
		}
	
	
	
	private static Object toBinaryString(int x) {
		String zero = "00000000000000000000000000000000";
		String tmp = zero + Integer.toBinaryString(x);
		return tmp.substring(tmp.length()-32);
	}
		
	}


