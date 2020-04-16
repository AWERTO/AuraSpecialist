public class ContactSearch {
    public static list<Contact> searchForContacts(String lastName, String mailingPostalCode){
        list<Contact> searchedContact = new List<Contact>();
        for(Contact con : [SELECT AccountId, Name FROM Contact WHERE LastName=:lastName AND MailingPostalCode=:mailingPostalCode]){
            searchedContact.add(con);
        } 
        return searchedContact;
    } 
}