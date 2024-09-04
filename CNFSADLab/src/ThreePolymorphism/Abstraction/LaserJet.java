package ThreePolymorphism.Abstraction;

class LaserJet extends Printer {
	 public LaserJet(String model) {
	     super(model);
	 }

	 public void configuration() {
	     System.out.println("LaserJet Printer configuration:");
	     // Add specific configuration details for LaserJet printers here
	 }
	}
