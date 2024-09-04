package FiveThreads;



public class Main {
    public static void main(String[] args) throws InterruptedException {
        Thread1 thread1 = new Thread1();
        Thread2 thread2 = new Thread2();
        thread1.setName("Thread One");
        System.out.println(thread1.getName());
        thread2.setName("Thread Two");
        System.out.println(thread2.getName());

        thread1.start();
        thread2.start();
        Thread obj=thread1;
        while(thread1.isAlive() || thread2.isAlive()) {
        System.out.println(thread1.getName()+" : "+thread1.getState());
        obj.interrupt();
        System.out.println(thread2.getName()+" : "+thread2.getState());
        Thread.sleep(1000);
        obj=thread2;
        }        

            thread1.join();
            thread2.join();

        System.out.println("Both threads have finished.");
    }
}

