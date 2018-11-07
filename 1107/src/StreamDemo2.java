import java.util.Arrays;
import java.util.OptionalInt;

public class StreamDemo2 {
	public static void main(String[] args) {
		//List<Integer> list = Arrays.asList(5,9,1,2,4,2,9,5);
		//List<String> list = Arrays.asList("Java-JDK1.8", "Python-Python3.7", "Oracle-Oracle12.2");
		//list.stream().distinct().forEach(System.out::println);
		//list.stream().filter(n -> n % 2 == 0).forEach(System.out::println);
		//list.stream().map(x -> x * x).forEach(System.out::println);
		//list.stream().flatMap(data -> Arrays.stream(data.split("-"))).forEach(System.out::println);
		/*Student s1 = new Student("이미자", 24);
		Student s2 = new Student("한지민", 34);
		Student s3 = new Student("설운도", 44);*/
		/*List<Student> list = Arrays.asList(s1, s2, s3);
		list.stream().mapToInt(Student::getAge).forEach(System.out::println);*/
		
		/*IntStream is = Arrays.stream(new int[] {1,2,3,4,5});
		is.asDoubleStream().forEach(System.out::println);*/
		
		/*List<Student> list = Arrays.asList(s1, s2, s3);
		Function<Student, Integer> fun = Student::getAge;
		list.stream().sorted(Comparator.comparing(fun)).forEach(System.out::println);*/
		
		//Integer [] array = new Integer[] {5,1,8,2,9,2,4};
		//List<Integer> list = Arrays.asList(array);
		//list.stream().sorted().forEach(System.out::println);
		//list.stream().filter(n -> n % 2 == 0).forEach(System.out::println);
		//list.stream().filter(n -> n % 3 ==0).peek(n -> System.out.println(n));
		//int total = list.stream().filter(n -> n % 2 == 0).sum();
		
		//int total = 
		//		Arrays.stream(array).filter(n -> n % 2 == 0).peek(System.out::println).sum();
		/*int total = 
				Arrays.stream(array).filter(n -> n % 2 == 0).forEach(System.out::println).sum();
		System.out.println(total);*/
		//List<Integer> list = Arrays.asList(new Integer[] {1,2,3,4,5});
		//System.out.println(list.stream().count());
		//Exception 발생시 1번째 해결방법
		OptionalInt oi = Arrays.stream(new int[] {}).max();
		/*if(oi.isPresent()) {
			System.out.println(oi.getAsInt());
		}else {
			System.out.println("Nothing");
		}*/
		//2번째 방법
		//System.out.println(oi.orElse(0));
		//3번째 방법
		oi.ifPresent(System.out::println);
	}
}
