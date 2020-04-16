global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
    global Integer recordsProcessed = 0;
	global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        	'SELECT Name, Status, Rating, Title, LeadSource FROM Lead'
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> updatedLead = new List<Lead>();
        for(Lead leads : records){
            leads.LeadSource = 'Dreamforce';
            updatedLead.add(leads);
            recordsProcessed = recordsProcessed + 1;
        }
        update updatedLead;
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
    }   
}