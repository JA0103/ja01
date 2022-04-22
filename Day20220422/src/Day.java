import java.util.Scanner;

public class Day {

	public static void main(String[] args) {
		//일 월 화 수 목 금 토 --> 랜덤하게 이 중 하나가 나오면
		//그에 맞는 소문자로 요일 입력
		//sunday, monday, tuesday, wendsday, thursday,
		//friday, saturday
		
		Scanner sc = new Scanner(System.in);
		
		String[] week = {"일","월","화","수","목","금","토"};
		String[] spell = {"sunday", "monday", "tuesday", "wendsday",
				           "thursday","friday", "saturday"};
		int re =0;
		
		do {
			
			int r = (int)(Math.random()*7);
			
			
			
			while(true){
				
				System.out.println(week[r] + " : ");
				String me = sc.nextLine();
				
				if(spell[r].equals(me)) break;
				System.out.println("오답입니다");
			} 
				
			System.out.println("정답입니다. 재도전(1) 종료(0)");
			String tmp = sc.nextLine();
			re = Integer.parseInt(tmp);
				
		}while(re == 1);
		
		System.out.println("프로그램 종료");
		
		
		
				
		
		
		
	}

}
