
public class FighterTest {

	public static void main(String[] args) {
		Fighter f = new Fighter();
		
		if(f instanceof Unit)//참조변수 f가 Unit울 참조하거나 Unit을 상속하는 클래스를 참조하면 OK
			System.out.println("f는 Unit 클래스의 자손입니다.");
		
		if(f instanceof Fightable)
			System.out.println("f는 Fightable 인터페이스를 구현했습니다.");
		
		if(f instanceof Movable)
			System.out.println("f는 Movable 인터페이스를 구현했습니다.");
		
		if(f instanceof Attackable)
			System.out.println("f는 Attackable 인터페이스를 구현했습니다.");
		
		if(f instanceof Object)
			System.out.println("f는 Object 클래스의 자손입니다.");
	}
}

class Fighter extends Unit implements Fightable{
	public void move(int x, int y) {}
	public void attack(Unit u) {}
}

class Unit{
	int currentHP;	//유닛의 체력
	int x;	//유닛의 위치(x좌표)
	int y;	//유닛의 위치(y좌표)
}

interface Fightable extends Movable, Attackable{}
interface Movable{ void move(int x, int y); }
interface Attackable{ void attack(Unit u); }
