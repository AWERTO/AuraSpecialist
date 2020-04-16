public with sharing class MaintenanceRequestHelper {
    public static void updateWorkOrders() {
        List<Case> newMR = new List<Case>();
        List<Case> requestsWithClosedStatus = [SELECT Id, Case.Vehicle__c, Equipment__c, Equipment__r.Maintenance_Cycle__c, Type, Status, Origin 
                                               FROM Case
                                               WHERE Id In :Trigger.New LIMIT 200];
        
        
        for(Case cases : requestsWithClosedStatus){
            if(cases.Type == 'Repair' || cases.Type == 'Routine Maintenance' && cases.Status == 'Closed'){
                Case c = new Case(Subject = 'Test',
                                  Type='Routine Maintenance',
                                  Vehicle__c=cases.Vehicle__c,
                                  Equipment__c=cases.Equipment__c,
                                  Date_Reported__c=date.Today(),
                                  Date_Due__c = Date.today().addDays(Integer.valueOf(cases.Equipment__r.Maintenance_Cycle__c)),
                                  Status='New',
                                  Origin=cases.Origin
                );
                newMR.add(c);
            }
    	}	
            if(newMR.size() > 0){
            insert newMR;
        }
    }        
    
}