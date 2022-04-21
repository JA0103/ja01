import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) {
		
		int num = 1;
		int num2 = 0;
		int num3 = 0;
		
		
		num = num +1;    //2
		num += 1;         //3
		
		++num;       //4
		num++;          //5
		
		num2 = ++num;   //전위형  6,6
		System.out.println(num + "," + num2);
		
		num3 = num++;   //후위형   7,6
		
		System.out.println(num+"," + num3);
		
		
		int i = 0;
		int j = 0;
		
		i +=1;
		j = i;     //j = ++i;  전위형
		
		i++;
		++i;
		j = i++;
		System.out.println(j + "," + i);
		
		j =++i;
		System.out.println(j + "," + i);
				
		int m = 0;
		int n = 0;
		
		n = m;
		m +=1;      //n = m++;  후위형
		
		
		
		char a = 'a';     //유니코드 97
		char d = 'd';    //유니코드 100
		char zero = '0';
		char two = '2';
		
		
		System.out.printf("'%c' - '%c' = %d%n", d, a, d - a);
		System.out.printf("'%c' - '%c' = %d%n", two, zero, two - zero);
		System.out.printf("'%c'=%d%n", a,  (int)a);
		System.out.printf("'%c'=%d%n", d,  (int)d);
		System.out.printf("'%c'=%d%n", zero,  (int)zero);
		System.out.printf("'%c'=%d%n", two,  (int)two);
		
		
		
		
		
		
	}

}
