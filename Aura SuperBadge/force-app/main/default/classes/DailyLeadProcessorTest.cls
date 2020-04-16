@isTest
private class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
	@isTest
    static void test(){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName = 'Test' + i, Company = 'Company ' + i, LeadSource = ''));
        }
        insert leads;
        
        Map<Id, Lead> leadsMap = new Map<Id, Lead>(leads);
        List<Id> leadsIds = new List<Id>(leadsMap.keySet());
        
        System.Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new DailyLeadProcessor()); 
        List<Task> lt = [SELECT Id FROM Task WHERE WhatId IN :leadsIds];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        System.Test.stopTest();
        
        
        	
        System.assertEquals(leadsIds.size(), [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce'], 'Tasks were not created');
   
        
    }
}