import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

public class Ex01 {

	public static void main(String[] args) throws IOException {

		int count=0;
		{
		
		File file = new File("data/Suwon.txt");
		FileInputStream infile = new FileInputStream(file);
		Scanner sc = new Scanner(infile);
		
		while(sc.hasNextLine()) {
			sc.nextLine();
			count++;
		}
		count--;// 순수 데이터 아닌 맨 윗줄 제외
		System.out.println("count : " +count);
		//다 닫아주자
		sc.close();
		infile.close();
		
		}
		
		
		
		String[] region = new String[count];//시도명
		String[] city = new String[count];//시군구명
		String[] district = new String[count];//구청명
		String[] dong = new String[count];//법정동명
		int[] variety = new int[count];//등록품종수
		String[] howmany = new String[count];//등록개체수
		String[] owner = new String[count];//소유자수
		String[] office = new String[count];//관리부서명
		String[] callnum = new String[count];//관리부서연락처
		String[] data = new String[count];//데이터기준일자
		
		{

			File file = new File("data/Suwon.txt");
			FileInputStream infile = new FileInputStream(file);
			Scanner sc = new Scanner( infile);
			
			// 등록품종수까지 출력
			
			sc.nextLine();  // 맨위에 데이터 아닌 첫 줄 버리기
			
			for(int i=0; i<count;i++) {
				
				String line = sc.nextLine(); 
				
				String[] tokens = line.split(",");
				
				region[i] = tokens[0];
				city[i] = tokens[1];
				district[i] = tokens[2];
				dong[i] = tokens[3];
				variety[i] = Integer.parseInt(tokens[4]);
				
				
				
				
				
			}
			for(int i=0; i<count; i++)
			System.out.printf("%s %s %s %s %d\n",region[i],city[i],district[i], dong[i], variety[i]);
			
			
			
			
		}
		
		
	}//main

}
