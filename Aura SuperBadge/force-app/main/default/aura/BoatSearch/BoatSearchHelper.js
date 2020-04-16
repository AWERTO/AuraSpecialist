({
	onSearch: function(component, helper, args){        
        var action = component.get("c.getBoats");
        
        var params = {"boatTypeId" : args};
        action.setParams(params);
        action.setCallback(this , function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                var boats = response.getReturnValue();
            	component.set("v.boats", boats);
            }        
        });
        
        $A.enqueueAction(action);
    }
})