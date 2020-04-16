public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer countOfContacts, String testString){
        List<Contact> newContactList = new List<Contact>();
        for(Integer i = 0; i < countOfContacts; i++){
            newContactList.add(new Contact(FirstName = testString + ' ' + i));
        }
        return newContactList;
    }
}