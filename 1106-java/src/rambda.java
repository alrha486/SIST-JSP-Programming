
public class rambda {
	public static void main(String[] args) {
		Student jimin = new Student();
		
		jimin.say(
					() -> { // () -> 는 Hello의 saySomething를 의미
						System.out.println("Hello, World");
						System.out.println("Good Java");
					}
				);
	}
}

@FunctionalInterface
interface Hello{
	void saySomething(); // return이 void이고 parameter가 없는 method
}

class Student{
	public void say(Hello hello) {
		hello.saySomething();
	}
}

