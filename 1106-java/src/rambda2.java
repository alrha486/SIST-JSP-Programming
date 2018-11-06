
public class rambda2 {
	public static void main(String[] args) {
		Calculator c = new Calculator();
		
		c.display( (a ,b) -> {
			return a + b;
		});
	}
}

@FunctionalInterface
interface Calc{
	int add(int a,int b);
}

class Calculator{
	public void display(Calc calc) {
		int answer = calc.add(10, 5);
		System.out.println("answer = " + answer);
	}
}



