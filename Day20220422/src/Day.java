import java.util.Scanner;

public class Day {

	public static void main(String[] args) {
		//일 월 화 수 목 금 토 --> 랜덤하게 이 중 하나가 나오면
		//그에 맞는 소문자로 요일 입력
		//sunday, monday, tuesday, wednesday, thursday,
		//friday, saturday
		
		Scanner sc = new Scanner(System.in);
		
		String[] dayKor = {"일","월","화","수","목","금","토"};
		String[] dayEng = {"sunday", "monday", "tuesday", "wednesday",
				           "thursday","friday", "saturday"};
		int re =0;
		int last =-1;
		int suc = 0;
		int fail = 0;
		
		do {

			int day = (int)(Math.random()*7); 
			
			//그 전이랑 나온 요일이 같지 않을때까지 반복
			do {
				day = (int)(Math.random()*7); 
			}while(last==day);
			
			
			while(true){
				
				System.out.println(dayKor[day] + " : ");
				String me = sc.nextLine();
				
				if(dayEng[day].equals(me)) break;
				
				System.out.println("오답입니다");
				fail++;
			} 
				
			System.out.println("정답입니다. 재도전(1) 종료(0)");
			suc++;
			
			String tmp = sc.nextLine();                              
			re = Integer.parseInt(tmp);  //엔터 버퍼 오류 방지 
			      						//-->이렇게 해줘도 됨 //re = sc.nextInt(); 
														 //sc.nextLine();
			
			
			last=day;
			
		}while(re == 1);
		
		System.out.println("프로그램 종료");
		System.out.println("성공횟수 : "+suc);
		System.out.println("실패횟수 : "+fail);
		
		
				
		
		
		
	}

}
