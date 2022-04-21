import java.util.Scanner;

public class Ex01 {

   public static void main(String[] args) {

      Scanner sc = new Scanner(System.in);
      int year, month, day, week, preY;
                                // 작년                        
      
      System.out.println("년도 입력 : ");
      year = sc.nextInt();
      System.out.println("월 입력 : ");
      month = sc.nextInt();
   
      int last[] = {31,28,31,30,31,30,31,31,30,31,30,31};
      
      //윤년
      if (month == 2 && (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)))
       {
            last[1] = 29;
       }

   
      //요일
      preY=year-1;
      day = (preY*365 + preY/4 - preY/100 + preY/400)+1; //작년까지 모든 일 수
      for(int i=0; i<month-1;i++) {
         day+=last[i];  //이번년도 원하는 달 전까지의 일 수
      }
      week = day%7;  //나머지가 요일    일(0), 월(1), 화(2), 수(3), 목(4), 금(5), 토(6)
      
      //출력
      System.out.printf("%n%d년 %d월",year,month);
      System.out.printf("%n=========");
      System.out.printf("%n---------------------");
      System.out.printf("%n일  월  화  수  목  금  토");
      System.out.printf("%n---------------------%n");
      
      //시작 요일 전 공백 출력
         for(int i=0;i<week;i++) {
            System.out.print("   ");
            }
         
         for(int i=1;i<=last[month-1];i++) {
            System.out.printf("%3d",i);      // i를 입력한 달의 일수만큼 출력
            week++;   
            if(week%7==0)
               System.out.println();
         }
      
   }//class.end

}