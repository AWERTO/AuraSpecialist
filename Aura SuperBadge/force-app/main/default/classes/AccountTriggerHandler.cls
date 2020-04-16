public class AccountTriggerHandler {
    public static List<Account> CreateAccounts(List<Account> accounts){
        List<Account> accountsWithTheSameState = new List<Account>();
        for(Account acc : accounts){
            acc.ShippingState = acc.BillingState;
            accountsWithTheSameState.add(acc);
            
        }
        return accountsWithTheSameState;
    }
}