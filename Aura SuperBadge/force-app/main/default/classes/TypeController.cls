public with sharing class TypeController {
	@AuraEnabled
    public static List<BoatType__c> getType(){
        return [SELECT Name FROM BoatType__c];
    }
}