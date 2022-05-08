import lombok.ToString;

public class Exercise6_5 {

	public static void main(String[] args) {
		Student1 s = new Student1 ("홍길동",1,1,100,60,76);

		System.out.println(s.info());
		System.out.println(s.toString());
	}
}

@ToString
class Student1{

	
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	
	//public Student1() {} //디폴트 생성자는 반드시 기입
	
	public Student1(String name, int ban, int no, int kor, int eng, int math){
		this.name = name;
		this.ban = ban;
		this.no = no;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	
		
	
	String info() {
		return name+","+ ban+","+no+","+kor+","+eng+","+math;  
	}

}

	