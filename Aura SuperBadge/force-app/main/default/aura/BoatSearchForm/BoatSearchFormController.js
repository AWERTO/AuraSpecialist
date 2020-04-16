({
    initBoatSearchForm : function(component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        if (createRecordEvent){
            component.set("v.showNewButton", true);
        }
        
        helper.initBoatTypes(component);
    },
    
    createNewBoat : function(component, event, helper) {
        var boatTypeId = component.find("boatTypeSelect").get("v.value");
        
        var createBoatRecordEvent = $A.get("e.force:createRecord");
        if(boatTypeId === ""){
            createBoatRecordEvent.setParams({"entityApiName": "Boat__c",
                "defaultFieldValues" : {
                    'Name' : boatTypeId
                }
            });
        }else{
            createBoatRecordEvent.setParams({"entityApiName": "Boat__c",
                "defaultFieldValues" : {
                    'BoatType__c' : boatTypeId
                }
            });
        }
        createBoatRecordEvent.fire();        
    },
    
    onFormSubmit : function(component, event, helper) {
        var boatTypeId = component.find("boatTypeSelect").get("v.value");
        var data = {
            "boatTypeId" : boatTypeId
        };
        
        var formsubmit = component.getEvent("formsubmit");
        formsubmit.setParams({
            "formData" : data
        });
        
        formsubmit.fire();
    }
    
    
})