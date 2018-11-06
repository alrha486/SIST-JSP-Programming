
public class rambda1 {
	public static void main(String[] args) {
		Student1 jimin = new Student1();
		
		jimin.say(
						() -> { return "Hello,world";	}
				);
	}
}

@FunctionalInterface
interface Hello1{
	String saySomething(); // return이 String이고 parameter가 없는 method
}

class Student1{
	public void say(Hello1 hello) {
		String word = hello.saySomething();
		System.out.println(word);	
	}
}

