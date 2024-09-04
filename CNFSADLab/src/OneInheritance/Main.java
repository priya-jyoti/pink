package OneInheritance;

import java.util.Scanner;



public class Main {
 public static void main(String[] args) {
     Scanner scanner = new Scanner(System.in);
     System.out.println("Enter staff details:");
     System.out.print("Name: ");
     String staffName = scanner.nextLine();
     System.out.print("Address: ");
     String staffAddress = scanner.nextLine();
     System.out.print("Phone No: ");
     String staffPhoneNo = scanner.nextLine();
     System.out.print("Email ID: ");
     String staffEmailId = scanner.nextLine();
     System.out.print("Employee ID: ");
     int empId = scanner.nextInt();
     scanner.nextLine(); // Consume the newline character
     System.out.print("Company: ");
     String company = scanner.nextLine();
     System.out.print("Designation: ");
     String designation = scanner.nextLine();

     Staff staff = new Staff(staffName, staffAddress, staffPhoneNo, staffEmailId, empId, company, designation);
     staff.calculateSalary();

     System.out.println();
     staff.displayDetails();

     System.out.println();

     System.out.println("Enter student details:");
     System.out.print("Name: ");
     String studentName = scanner.nextLine();
     System.out.print("Address: ");
     String studentAddress = scanner.nextLine();
     System.out.print("Phone No: ");
     String studentPhoneNo = scanner.nextLine();
     System.out.print("Email ID: ");
     String studentEmailId = scanner.nextLine();
     System.out.print("USN: ");
     String usn = scanner.nextLine();
     System.out.print("Branch: ");
     String branch = scanner.nextLine();

     Student student = new Student(studentName, studentAddress, studentPhoneNo, studentEmailId, usn, branch);
     student.calculateFees();

     System.out.println();
     student.displayDetails();

     scanner.close();
 }
}