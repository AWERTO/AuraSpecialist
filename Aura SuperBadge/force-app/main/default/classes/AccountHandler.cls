public class AccountHandler {
    /* public static Account insertNewAccount(String name){
        try{
           Account acc = new Account();
        	acc.Name = name;
            insert acc;
            return acc;
        }
        catch (DmlException e){
            return null;
        }
        
    }*/
    public static void insertAccount(Integer Value){
        Integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        
        while(counter <= value){
            System.debug('Counter Value before Incrementing' + counter);
            
            
            Account store = new Account ();
            store.Name = 'Acme Inc ' + counter;
            store.AccountNumber = 'A000' + counter;
            addAccounts.add(store);
            
            System.debug(addAccounts);
            
            counter = counter + 1;
            System.debug('Counter Value after incrementing' + counter);
        }
            
        System.debug('Size of Account List: ' + addAccounts.size() );    
        System.debug('Elements in Account List: ' + addAccounts);
        insert addAccounts;
    }
}