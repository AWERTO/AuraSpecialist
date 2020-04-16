public class AddPrimaryContact implements Queueable{
    
    private Contact contacts;
    private String state;
    public addPrimaryContact(Contact records, String state) {
        this.contacts = records;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> newContact = new List<Contact>();
        List<Account> listOfRelatedAccount = [SELECT Id, BillingState, (SELECT Id, FirstName, LastName FROM Contacts ) FROM Account WHERE BillingState = :state LIMIT 200];
            for(Account acc : listOfRelatedAccount){
                Contact contactCoppy = contacts.clone(false,false,false,false);
                contactCoppy.AccountId = acc.Id;
                newContact.add(contactCoppy);
        	}	   

       
               //
        if(newContact.size() > 0 ){
            insert newContact;
        }
        
    }   
}