package ThreePolymorphism.Abstraction;

abstract class Printer {
	 private String model;

	 public Printer(String model) {
	     this.model = model;
	 }

	 public abstract void configuration();

	 public void display() {
	     System.out.println("Printer Model: " + model);
	 }
	}

