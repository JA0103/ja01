
public class Exam01 {

	public static void main(String[] args) {
		

		Student s = new Student();
		s.setName("홍길동");
		s.setBan(2);
		s.setEng(14);
		
		System.out.println(s.getBan());
		System.out.println(s.getAverage());
	}

}


class Student{
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	
		
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	int getTotal() {
		return kor+eng+math;
	}
			
	double getAverage() {
		return getTotal()/3;
	}
}