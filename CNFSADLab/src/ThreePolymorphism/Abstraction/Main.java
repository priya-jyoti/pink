package ThreePolymorphism.Abstraction;

import java.util.Scanner;


public class Main {
 public static void main(String[] args) {
     Scanner scanner = new Scanner(System.in);

     Printer printer = null;

     while (true) {
         System.out.println("\nMenu: \n 1. Create Dot-matrix Printer \n2. Create LaserJet Printer \n3. Display Printer Configuration \n4. Exit \nEnter your choice: ");
         int choice = scanner.nextInt();
         switch (choice) {
             case 1:
                 System.out.print("Enter Dot-matrix Printer model: ");
                 String dotMatrixModel = scanner.next();
                 printer = new DotMatrix(dotMatrixModel);
                 break;
             case 2:
                 System.out.print("Enter LaserJet Printer model: ");
                 String laserJetModel = scanner.next();
                 printer = new LaserJet(laserJetModel);
                 break;
             case 3:
                 if (printer != null) {
                     printer.configuration();
                     printer.display();
                 } else {
                     System.out.println("Please create a printer first.");
                 }
                 break;
             case 4:
                 System.out.println("Exiting the program...");
                 scanner.close();
                 System.exit(0);
             default:
                 System.out.println("Invalid choice. Try again.");
         }
     }
 }
}
