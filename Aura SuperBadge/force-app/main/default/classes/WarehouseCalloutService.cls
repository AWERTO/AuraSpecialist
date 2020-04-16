public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    @future(callout=true)
    public static void runWarehouseEquipmentSync() {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            List<Product2> newList = new List<Product2>();
            for(Object equipment : results)
            { 
                Map<String, Object> mapobj = (Map<String, Object>) equipment;
                Product2 product = new Product2();

                product.Name  = (String)mapobj.get('name'); 
                product.Maintenance_Cycle__c = (Integer)mapobj.get('maintenanceperiod');
                product.Cost__c = (Integer)mapobj.get('cost');
                product.Current_Inventory__c = (Integer)mapobj.get('quantity');
                product.Lifespan_Months__c = (Integer)mapobj.get('lifespan'); 
                product.Replacement_Part__c = (Boolean)mapobj.get('replacement');
                product.Warehouse_SKU__c = (String) mapobj.get('sku');
                product.ProductCode = (String)mapobj.get('_id');       
                newList.add(product);
            }
                   upsert newList; 
        }
    }
}