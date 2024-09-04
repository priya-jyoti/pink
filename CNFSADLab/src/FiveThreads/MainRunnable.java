package FiveThreads;

class run1 implements Runnable {@Override
	public void run()  {
    for (int i = 1; i <= 5; i++) {
        System.out.println("Running  "+Thread.currentThread().getName()+" : "+ i);
        try {
            Thread.sleep(1500); // Sleep for 2 seconds
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
	}
class run2 implements Runnable {
	@Override
    public void run() {
    for (int i = 10; i <= 15; i++) {
        System.out.println("Running "+ Thread.currentThread().getName() +" : "+ i);
        try {
            Thread.sleep(600); // Sleep for 2 seconds
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
	}


public class MainRunnable {
    public static void main(String[] args) throws InterruptedException {
    	System.out.println("Runnable Way ");
    	Thread thread1 = new Thread(new run1());
        Thread thread2 = new Thread(new run2());
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
