public class AccountProcessor {
    @future public static void countContacts(List<Id> accId){
        List<Account> listOfContacts = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accId];
        if(accId.size() > 0){
           for(Account acc : listOfContacts){
               List<Contact> lstCont = acc.contacts;
                acc.Number_of_Contacts__c = lstCont.size();
            }
        }else{
            listOfContacts.size();
        }
        update listOfContacts;
    }
}