({
	onBoatClick : function(component, event, helper) {
        var selectedBoat = component.get("v.boat");
        
        var boatselect = component.getEvent("boatselect");
        boatselect.setParams({
            "boatId" : selectedBoat.Id
        });
        boatselect.fire();
        
        var boatselected = $A.get("e.c:BoatSelected");
        boatselected.setParams({
            "boat" : selectedBoat
        });
        boatselected.fire();
        
        var boat = component.get("v.boat");
        var plotMapMarkerEvent = $A.get("e.c:PlotMapMarker");
        plotMapMarkerEvent.setParams(
            {
                "lat": boat.Geolocation__Latitude__s,
                "sObjectId": boat.Id,
                "long": boat.Geolocation__Longitude__s,
                "label": boat.Name 
            }
        );
        plotMapMarkerEvent.fire();
	}
})