public class AccountUtils {
    public static List<Account> accountsByState(String state){
        List<Account> accountWithThisState = [SELECT Id, Name FROM Account WHERE BillingState = :state];
        return accountWithThisState;
    }
}