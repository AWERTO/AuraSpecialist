({
	clickCreateItem : function(component, event, helper) {
		var validExpense = component.find('itemsform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        var newItem = component.get("v.newItem");
        var newItems = JSON.parse(JSON.stringify(newItem));
        component.set("v.items", newItems);
	},
    handleUpdateExpense: function(component, event, helper) {
        var updatedExp = event.getParam("expense");
        helper.updateExpense(component, updatedExp);
    }

})