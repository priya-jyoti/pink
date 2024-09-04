package OneInheritance;

import java.util.Scanner;


class Student extends Person implements Student_Op {
	 private String usn;
	 private String branch;
	 private double fees;

	 public Student(String name, String address, String phoneNo, String emailId, String usn, String branch) {
	     super(name, address, phoneNo, emailId);
	     this.usn = usn;
	     this.branch = branch;
	 }

	 public void displayDetails() {
	     super.displayDetails();
	     System.out.println("USN: " + usn);
	     System.out.println("Branch: " + branch);
	     System.out.println("Fees: $" + fees);
	 }

	 public void calculateFees() {
	     Scanner scanner = new Scanner(System.in);
	     System.out.print("Enter fees for " + name + ": $");
	     fees = scanner.nextDouble();
	     this.fees += (fees*0.18);

	     scanner.nextLine(); // Consume the newline character
	     System.out.print("Your Final fees is"+this.fees);
	     scanner.close();
	 }
	}
