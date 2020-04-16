trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> newTasks = new List<Task>();
    if(Trigger.isInsert){
        for(Opportunity op : Trigger.New){
            if (op.StageName == 'Closed Won'){
            newTasks.add(new Task(WhatId = op.Id,
                                  Subject = 'Follow Up Test Task'
                                 ));
            }
        }
        insert newTasks;
    }
    if(Trigger.isUpdate){
        for(Opportunity op : Trigger.New){
            newTasks.add(new Task(WhatId = op.Id, 
                                  Subject = 'Follow Up Test Task'
                                 ));
        }
       
    }
}