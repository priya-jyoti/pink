package OneInheritance;

class Person {
	 protected String name;
	 protected String address;
	 protected String phoneNo;
	 protected String emailId;

	 public Person(String name, String address, String phoneNo, String emailId) {
	     this.name = name;
	     this.address = address;
	     this.phoneNo = phoneNo;
	     this.emailId = emailId;
	 }

	 public void displayDetails() {
	     System.out.println("Name: " + name);
	     System.out.println("Address: " + address);
	     System.out.println("Phone No: " + phoneNo);
	     System.out.println("Email ID: " + emailId);
	 }
	}
