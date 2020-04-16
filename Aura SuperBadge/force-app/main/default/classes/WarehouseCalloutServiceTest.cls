@IsTest
private class WarehouseCalloutServiceTest {
    @TestSetup
    public static void setup(){
    	Account acct = new Account(Name= 'Test');
       		insert acct;
    	Contact cont = new Contact(LastName = 'Test', AccountID = acct.id, email = 'testcont@test.com');
        	insert cont;
    	Product2 prd1 = new Product2(Name = 'Test', Maintenance_Cycle__c = 2, Replacement_Part__c = true);
        	insert prd1;
    	Vehicle__c vhcl1 = new Vehicle__c(Name = 'Test');
        	insert vhcl1;
       List<Case> mntRequest = new List<Case>();
        for (Integer i = 0; i < 300; i++){
        	mntRequest.add(new Case(description = 'Test',
                                Subject = 'Other',
                                Type = 'Repair',
                                Status = 'Closed',
                                origin = 'Web',
                                Date_Reported__c = date.today(),
                                Date_Due__c = date.today(),
                                Vehicle__c = vhcl1.id,
                                Equipment__c = prd1.id));    
        }
       
            
        insert mntRequest;
        List<Work_Part__c> workPartList = new List<Work_Part__c>();
        for(Case c : mntRequest){
            workPartList.add(new Work_Part__c(Equipment__c = prd1.Id, Maintenance_Request__c = c.id));
        }
               
        insert workPartList;
        
    }
   
    @isTest
    public static void TestUpdateWithPositiveOneCase(){
    	Case oneCase = [SELECT Type, Status FROM Case WHERE Status = 'Closed' AND Type = 'Repair' LIMIT 1];
        oneCase.Status = 'Closed';
        System.Test.startTest();  
        update oneCase; 
        System.Test.stopTest();
    }
    
    @isTest
    public static void TestUpdateWithBulkCase(){
        List<Case> bulkCases = [SELECT Id, Type, Status FROM Case WHERE Status = 'Closed' AND Type = 'Repair' LIMIT 300];
        List<Case> casesToUpdate = new List<Case>();
        for(Case cas : bulkCases){
            cas.Type = 'Routine Maintenance';
            casesToUpdate.add(cas);
        }
        System.Test.startTest();  
        update casesToUpdate; 
        System.Test.stopTest();
    }
    @isTest
    public static void warehouseCalloutServiceMock(){
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());        
        WarehouseCalloutService.runWarehouseEquipmentSync();
        System.Test.stopTest();
        System.assertEquals(23, [SELECT count() FROM Product2]);
    }
    
    @isTest
    public static void testWarehouseSyncSchedule(){
        
            String CRON_EXP = '0 0 1 * * ?';
            System.Test.startTest();
        	System.Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
            String jobId = System.schedule('testBasicScheduledApex', CRON_EXP, new WarehouseSyncSchedule());
        	Integer sCount = [SELECT count() FROM Product2 WHERE 
                      Replacement_Part__c = True AND 
                      Current_Inventory__c = 100 AND 
                      Name = 'Breaker 25A' AND 
                      Maintenance_Cycle__c = 0 AND 
                      Lifespan_Months__c = 0 AND 
                      Cost__c = 30 AND 
                      Warehouse_SKU__c = '100012'];
            System.assertEquals(0, sCount);
        	CronTrigger cTId = [SELECT State FROM CronTrigger WHERE Id = :jobID];
            System.Test.stopTest();
        	Integer count = [SELECT count() FROM Product2 WHERE 
                      Replacement_Part__c = True AND 
                      Current_Inventory__c = 100 AND 
                      Name = 'Breaker 25A' AND 
                      Maintenance_Cycle__c = 0 AND 
                      Lifespan_Months__c = 0 AND 
                      Cost__c = 30 AND 
                      Warehouse_SKU__c = '100012'];
        	System.assertEquals(0, count);
    }
    
    
}