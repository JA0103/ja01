import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


//!! 중복 x 순서 x !!
public class HashSetEx01 {

	public static void main(String[] args) {
		Set<String> set = new HashSet<String>();
		
		set.add("toy");
		set.add("box");
		set.add("robot");
		set.add("Box");
		set.add("toy");
		
		System.out.println("cnt : "+set.size());
		
		for(Iterator<String> itr = set.iterator(); itr.hasNext();)
				System.out.print(itr.next()+ "\t");
	
		System.out.println();
		
		for(String s : set)
			System.out.print(s + "\t");
	
	
	}
	
	
	
	
	
}
