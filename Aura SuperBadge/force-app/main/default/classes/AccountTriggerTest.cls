@isTest
public class AccountTriggerTest {
	@isTest
    public static void testAccountTriggerHandler(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 200; i++){
            accounts.add(new Account(Name = 'Test ' + i, BillingState = 'CA'));
        }
        System.Test.startTest();
        insert accounts;
        System.Test.stopTest();
        Integer count = [SELECT count() FROM Account WHERE ShippingState = 'CA'];
        System.assertEquals(200, count);
        
    }
}