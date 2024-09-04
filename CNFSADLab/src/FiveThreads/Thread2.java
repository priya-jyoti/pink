package FiveThreads;


class Thread2 extends Thread {
    @Override
    public void run() {
        for (int i = 10; i <= 15; i++) {
            System.out.println("Running "+this.getName() +" : "+ i);
            try {
                Thread.sleep(600); // Sleep for 2 seconds
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}