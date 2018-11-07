import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.function.Consumer;

public class StreamDemo {
	public static void main(String[] args) {
		Integer [] array = {4,6,1,9,2};
		List<Integer> list = Arrays.asList(array); // 배열을 리스트로 반환해주는 asList
/*		1. 1st way
		 * for(int i = 0 ; i < list.size() ; i++)
			System.out.println(list.get(i));
		
		2. 2nd way
		 * for(Integer in : list)  System.out.println(in);
		 
		
		3. 3rd way
		 * Iterator<Integer> iters = list.iterator();
		while(iters.hasNext())   System.out.println(iters.next());
		
		4. 4th way
		 * list.forEach(new Consumer<Integer>() {
			@Override
			public void accept(Integer t) {
				System.out.println(t);
			}
		});
		
		5. 5th way
		 * list.forEach((t) -> System.out.println(t));*/
		
		list.forEach(System.out::println);
 	}
}
