package EightGeneric;


import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        NumberContainer<Number> container = new NumberContainer<>();
        
        while (true) {
            System.out.println("\nMenu:");
            System.out.println("1. Add Number");
            System.out.println("2. Calculate Sum");
            System.out.println("3. Sort Numbers");
            System.out.println("4. Display List");
            System.out.println("5. Exit");
            System.out.print("Enter your choice: ");

            int choice = scanner.nextInt();
            
            switch (choice) {
                case 1:
                    System.out.print("Enter a number: ");
                    if (scanner.hasNextInt()) {
                        int intValue = scanner.nextInt();
                        container.add(intValue);
                    } else if (scanner.hasNextDouble()) {
                        double doubleValue = scanner.nextDouble();
                        container.add(doubleValue);
                    } else {
                        System.out.println("Invalid input. Please enter a valid number.");
                        scanner.nextLine(); // Consume the invalid input
                    }
                    break;
                case 2:
                    double sum = container.calculateSum(container.getList());
                    System.out.println("Sum of Numbers: " + sum);
                    break;
                case 3:
                    List<Number> sortedList = container.sort(container.getList());
                    System.out.println("Sorted List: " + sortedList);
                    break;
                case 4:
                    List<Number> list = container.getList();
                    System.out.println("Number List: " + list);
                    break;
                case 5:
                    System.out.println("Exiting the program.");
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice. Please select a valid option.");
            }
        }
    }
}
