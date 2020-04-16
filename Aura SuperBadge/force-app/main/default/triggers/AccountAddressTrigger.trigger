trigger AccountAddressTrigger on Account (before insert, before update) {
    List<Account> updatedAccount = new List<Account>();
        if (Trigger.isInsert) {
            for(Account ac : Trigger.New){
                if (ac.Match_Billing_Address__c == true){
                    ac.ShippingPostalCode = ac.BillingPostalCode;
                    updatedAccount.add(ac);
                }
            }
        }
    if (Trigger.isUpdate){
        for(Account ac : Trigger.Old){
                if (ac.Match_Billing_Address__c == true){
                    ac.ShippingPostalCode = ac.BillingPostalCode;
                    updatedAccount.add(ac);
                }
            }
        update updatedAccount;
    }
    
}