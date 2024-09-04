package EightGeneric;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class NumberContainer<T extends Number> {
    private List<T> numberList = new ArrayList<>();

    public void add(T number) {
        numberList.add(number);
    }

    public double calculateSum(List<? extends Number> list) {
        double sum = 0;
        for (Number number : list) {
            sum += number.doubleValue();
        }
        return sum;
    }

    public List<T> sort(List<? extends Number> list) {
        List<T> sortedList = new ArrayList<>(numberList);
        Collections.sort(sortedList, (a, b) -> Double.compare(a.doubleValue(), b.doubleValue()));
        return sortedList;
    }

    public List<T> getList() {
        return numberList;
    }
}
