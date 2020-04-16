@isTest
public class LeadProcessorTest {
    @testSetup 
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for (Integer i=0; i<200; i++) {
            leads.add(new Lead(LastName = 'Test' + i, Company = 'Company ' + i));
        }
        insert leads;
    }
    
    @isTest 
    static void test(){
        System.Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        System.Test.stopTest();
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}