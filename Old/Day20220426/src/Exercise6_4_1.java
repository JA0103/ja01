import lombok.Getter;
import lombok.Setter;

public class Exercise6_4_1 {

	public static void main(String[] args) {
		
		Student2 s = new Student2("손흥민",1,10,90,100,60);   //생성자 호출
		System.out.println(s.getName());
		System.out.println(s.getTotal());
		
		System.out.println("------------------");
		Student2 s2 = new Student2("김진아",8,18,90,100,100);   //생성자 호출
		System.out.println(s2.getName());
		System.out.println(s2.getTotal());
		
		System.out.println("-------------------");
	}

}

// private < default < protected < public


@Getter  //어노테이션
@Setter

class Student2{
	
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	
	public Student2(String name, int ban,int no, int kor,int eng, int math) {
		this.name= name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		
	}
	
	public char[] getName() {
		// TODO Auto-generated method stub
		return null;
	}

	int getTotal() {
		int sum = kor+eng+math;
		return sum;
	}
	
	double getAverage() {
		return getTotal()/3.0;
	}
}