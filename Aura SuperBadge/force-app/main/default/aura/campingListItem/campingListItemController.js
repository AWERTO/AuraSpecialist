({
	packItem : function(component, event, helper) {
        var itemValue = component.get("v.item", true);
        itemValue.Packed__c = true;
        component.set("v.item", itemValue);
                      
		var btnMessage = event.getSource().set("v.disabled", true);
	}
})