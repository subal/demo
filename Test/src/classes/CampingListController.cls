public with sharing class CampingListController {   
    

    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON

    @AuraEnabled
    public static List<Camping_Item__c> getItems() {
        return [SELECT Id, Name, Quantity__c, Price__c,Packed__c, 
                        CreatedDate 
                FROM Camping_Item__c];        
           }
    
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c newItem){
        upsert newItem;
        return newItem;
    }


}