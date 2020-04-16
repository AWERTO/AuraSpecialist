trigger AccountDeletion on Account (before delete) {
    for(Account a : [SELECT Id FROM Account Where Id IN (SELECT AccountId FROM Opportunity) AND Id IN : Trigger.Old]){
        Trigger.OldMap.get(a.Id).addError('Cannnot delete record which have related opporunity.');
    }
}