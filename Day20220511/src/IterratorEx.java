import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class IterratorEx {

	public static void main(String[] args) {
		List<String> list = new LinkedList<String>();
		list.add("toy");
		list.add("box");
		list.add("robot");
		list.add("toy");

		//list, set, map
		for( String e : list)
			System.out.println(e + '\t');
		
		System.out.println("======");
		//next() >> 다음값 반환
		//hasNext() >> 가져올 데이터 있는가?
		//remove >> next() 호출 통해 반환된 인스턴스 삭제
		Iterator<String> it = list.iterator();
		
		while(it.hasNext()) {
			String str = it.next();
			if(str.equals("toy")) it.remove();
			System.out.println(str + '\t');
		}
		
		System.out.println("======");
		Iterator<String> it2 = list.iterator();
		
		while(it2.hasNext()) {
			String str2 = it2.next();
			if(str2.equals("toy")) it.remove();
			System.out.println(str2 + '\t');
		}
	}

}
