
public class ExerciseAlone {
	public static void main(String[] args) {
		
	 Student3 s = new Student3();
		 
		 
		 
		System.out.println("이름: ");
		System.out.println("평균: ");
		System.out.println("총점: ");
		
	}
}


class Student3{
	
	
	//private 붙이면 getter setter 해줘야함
	//private 안붙이면 ex)s.name = " " 메인에서 이런식으로 바로 터치 가능
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	

	
	private int getTotal() {
		return kor+eng+math;
	}
	
	private int getAverage() {
		return getTotal()/3;
	}
	
		
	
	
	
}