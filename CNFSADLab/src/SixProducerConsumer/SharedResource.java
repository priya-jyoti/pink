package SixProducerConsumer;

class SharedResource {
    private int data;
    private boolean available = false; // Indicates whether data is available for consumption

    public synchronized int getData() {
        while (!available) {
            try {
                wait(); // Wait if data is not available
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        available = false;
        notify(); // Notify producer that data has been consumed
        return data;
    }

    public synchronized void setData(int value) {
        while (available) {
            try {
                wait(); // Wait if data is still available
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        data = value;
        available = true;
        notify(); // Notify consumer that new data is available
    }
}
