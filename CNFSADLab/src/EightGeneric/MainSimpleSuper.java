package EightGeneric;

import java.util.*;

public class MainSimpleSuper {
	private static double sum(List<? extends Number> arr) {
		double sum = 0;
		for(Number i : arr) {
			sum += i.doubleValue();
		}
		return sum;
	}
	
	private static void sort(List<? extends Number> arr) {
		arr.sort(null);
		System.out.println(arr);
	}
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.println("Enter choice: \n1.Integer value \n2.Double value \n3.Exit");
			int ch = sc.nextInt();
			
			switch (ch) {
				case 1: {
					List<Integer> arr = new ArrayList<>();
					System.out.println("Enter integer values(to end input enter character):");
					while (sc.hasNext()) {
                      if (sc.hasNextInt()) {
                          arr.add(sc.nextInt());
                      } else {
                          sc.next();
                          break;
                      }
                  }
					System.out.println("1.Sum \n2.Sort");
					int choice = sc.nextInt();
					switch (choice) {
						case 1: {
							System.out.println("Sum = " + sum(arr));
							break;
						}
						case 2: {
							sort(arr);
							break;
						}
						default:
							System.exit(0);
					}
					break;
				}
				case 2: {
					List<Double> arr = new ArrayList<>();
					System.out.println("Enter double values(to end input enter character):");
					while (sc.hasNext()) {
                      if (sc.hasNextDouble()) {
                          arr.add(sc.nextDouble());
                      } else {
                          sc.next();
                          break;
                      }
                  }
					sc.nextLine();
					System.out.println("1.Sum \n2.Sort");
					int choice = sc.nextInt();
					switch (choice) {
						case 1: {
							System.out.println("Sum = " + sum(arr));
							break;
						}
						case 2: {
							sort(arr);
							break;
						}
						default:
							System.exit(0);
					}
					break;
				}
				case 3:
					System.exit(0);
				default:
					System.out.println("Invalid choice");
			}
		}
	} 
}