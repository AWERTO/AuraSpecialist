@isTest
public class TestRestrictContactByName {
    @isTest static void TestRestrictedContact(){
        Contact con1 = new Contact(FirstName = 'Vlad', LastName = 'Mazuryk');
        Contact con2 = new Contact(FirstName = 'Vlad', LastName = 'INVALIDNAME');
        List<Contact> contacts = new List<Contact>{con1, con2};
            System.Test.startTest();
            try{
                insert contacts;
            }catch(Exception e){
            }
        	System.Test.stopTest();
    }
}