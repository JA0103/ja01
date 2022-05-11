import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class ListIteratorEx {

	public static void main(String[] args) {
		List<String> list = Arrays.asList("toy","box","robot","box");
		
		System.out.println(list);
	
		list = new ArrayList<String>(list);
		list.add("box");
		System.out.println(list);
		
		ListIterator<String> it = list.listIterator(); //양방향 가능
		
		while(it.hasNext()) {
			String str = it.next();
			System.out.print(str+'\t');
		}
		
		System.out.println();
		
		//이전으로 출력
		while(it.hasPrevious()) {
			String str = it.previous();
			System.out.print(str+'\t');
		}
		
		System.out.println();
		
		for(Iterator<String> itr = list.iterator(); itr.hasNext();)
			System.out.print(itr.next() + '\t');
		
//	-->	ListIterator<String> it = list.listIterator(); //양방향 가능
//		while(it.hasNext()) {
//			String str = it.next();
//			System.out.print(str+'\t');
//		}
//		
//		System.out.println();
		System.out.println();
		
		List<String> li = Arrays.asList("g","h","d","h");
		
		li = new ArrayList<String>(li);
		
		li.add("e");
		
		System.out.println(li);
		
		for(String str2 : li)
			System.out.print(str2 + "\t");
		
		System.out.println();
		
		ListIterator<String> liit = li.listIterator();
		
		while(liit.hasNext()) {
			
			String str3 =  liit.next();
			System.out.print(str3 + '\t');
		}
		
		System.out.println();
		
		while(liit.hasPrevious()) {
			
			String str3 = liit.previous();
			System.out.print(str3 + '\t');
		}
	}

}
