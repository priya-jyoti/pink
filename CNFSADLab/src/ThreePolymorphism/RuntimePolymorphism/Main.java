package ThreePolymorphism.RuntimePolymorphism;


public class Main {
 public static void main(String[] args) {
     Vehicle vehicle1 = new Car();
     Vehicle vehicle2 = new Motorcycle();

     vehicle1.drive();
     vehicle1.displayType();

     vehicle2.drive();
     vehicle2.displayType();
 }
}
