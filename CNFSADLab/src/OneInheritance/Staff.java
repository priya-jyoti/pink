package OneInheritance;

import java.util.Scanner;

class Staff extends Person implements Staff_Op {
	 private int empId;
	 private String company;
	 private String designation;
	 private double salary;

	 public Staff(String name, String address, String phoneNo, String emailId, int empId, String company, String designation) {
	     super(name, address, phoneNo, emailId);
	     this.empId = empId;
	     this.company = company;
	     this.designation = designation;
	 }

	 public void displayDetails() {
	     super.displayDetails();
	     System.out.println("Employee ID: " + empId);
	     System.out.println("Company: " + company);
	     System.out.println("Designation: " + designation);
	     System.out.println("Salary: $" + salary);
	 }

	 public void calculateSalary() {
	     Scanner scanner = new Scanner(System.in);
	     System.out.print("Enter salary for " + name + ": $");
	     salary = scanner.nextDouble();
	     this.salary=salary+(salary*0.15);
	     scanner.nextLine(); // Consume the newline character
	     System.out.print("Your Final Salary is"+this.salary);
	 }
	}

