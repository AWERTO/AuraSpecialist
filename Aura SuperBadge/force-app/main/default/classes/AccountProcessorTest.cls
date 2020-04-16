@isTest
public class AccountProcessorTest {
    
    
    @isTest static void TestCountOfEmptyContacts(){
        Account acc2 = new Account(Name = 'Test');
        insert acc2;
        List<Id> listAccId = new List<Id>();
        listAccId.add(acc2.Id);
        System.Test.startTest();
       	AccountProcessor.countContacts(listAccId);
        System.Test.stopTest();
        Account accWithNoContact = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :acc2.Id];
        System.assertEquals(Integer.valueOf(accWithNoContact.Number_of_Contacts__c), 0);
    }
}