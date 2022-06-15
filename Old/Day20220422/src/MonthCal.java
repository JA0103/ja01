import java.util.Scanner;


//>> 해당 월의 영어 단어를 입력하는 프로그램

public class MonthCal {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		String[] monthString = {
									"January","February","March","April","May","June",
									"July","August","September","October","November","December"
								};
		System.out.println("해당 월의 영어 단어를 입력하세요.");
		System.out.println("첫 글자는 대문자, 그 이후는 소문자로 입력");
		
		int retry= 0;
		int last =-1; //이전 월
		
		
			
		
			do {
				int month= (int)(Math.random()*12);//맨 처음 
				
				//반복 했을 때 직전 월과 같은 달이 나오지 않을때까지 돌아감
				if(retry==1) {
					
					do {
						month= (int)(Math.random()*12);
						}while(last==month);
					
				}
				
				while(true) {
					System.out.print((month+1) + "월 : ");
					String qus = sc.nextLine();
					
					if(qus.equals(monthString[month])) break; //정답
					System.out.println("오답입니다.");
				}
				
				last=month;
				
				System.out.println("정답입니다 >> 재도전(1) : 그만(0) : ");
				retry = sc.nextInt();
				sc.nextLine();
				
			}while(retry == 1);
	
			
		System.out.println("프로그램 종료");
	}

}
