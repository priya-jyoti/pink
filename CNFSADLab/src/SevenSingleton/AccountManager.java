package SevenSingleton;
import java.util.HashMap;
import java.util.Map;
class AccountManager {
    private static final AccountManager INSTANCE = new AccountManager();
    private final Map<Integer, Account> accounts = new HashMap<>();
    private AccountManager() {}
    public static AccountManager getInstance() {
        return INSTANCE;
    }
    public void createAccount(int accountNumber, String accountHolder, double initialBalance) {
        if (!accounts.containsKey(accountNumber)) {
            accounts.put(accountNumber, new Account(accountNumber, accountHolder, initialBalance));
            System.out.println("Account created for " + accountHolder + " with account number " + accountNumber);
        } else {
            System.out.println("Account with account number " + accountNumber + " already exists.");
        }
    }
    public void deposit(int accountNumber, double amount) {
        Account account = accounts.get(accountNumber);
        if (account != null) {
            account.deposit(amount);
            System.out.println("Deposited " + amount + " into account " + accountNumber);
        } else {
            System.out.println("Account with account number " + accountNumber + " not found.");
        }
    }
    public void withdraw(int accountNumber, double amount) {
        Account account = accounts.get(accountNumber);
        if (account != null) {
            if (account.withdraw(amount)) {
                System.out.println("Withdrawn " + amount + " from account " + accountNumber);
            } else {
                System.out.println("Insufficient balance in account " + accountNumber);
            }
        } else {
            System.out.println("Account with account number " + accountNumber + " not found.");
        }
    }
    public double getBalance(int accountNumber) {
        Account account = accounts.get(accountNumber);
        if (account != null) {
            return account.getBalance();
        } else {
            System.out.println("Account with account number " + accountNumber + " not found.");
            return 0.0;
        }
    }
}