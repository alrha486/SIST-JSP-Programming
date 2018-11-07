import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

public class StreamDemo1 {
	public static void main(String[] args) {
		Student s1 = new Student("이진웅", 24);
		Student s2 = new Student("호날두", 29);
		Student s3 = new Student("리메시",28);
		
//		Function<Student, Integer> f1 = Student::getAge;  // ::(더블콜론연산자>>객체명::리턴을하는 메소드)
//		System.out.println(f1.apply(s1));
//		System.out.println(f1.apply(s2));
		List<Student> list = Arrays.asList(s1,s2,s3);
		list.forEach(System.out::println);
		
	}
}
class Student{
	private String name;
	private int age;
	
	public Student(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + "]";
	}
}