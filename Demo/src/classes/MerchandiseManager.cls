@RestResource(urlMapping='/Merchandise/*')
global with sharing class MerchandiseManager {
@HttpGet
global static MyClass getMerchandiseById() {
RestRequest req = RestContext.request;
String merchId = req.requestURI.substring(
req.requestURI.lastIndexOf('/')+1);

MyClass my=new MyClass();
//Merchandise__c result =
my.mer=
[SELECT Name,Description__c,Price__c,Total_Inventory__c
FROM Merchandise__c 
];
return my ;
}

global  class MyClass{
  Integer a=10;
  Merchandise__c[] mer;
  
}

@HttpPost
global static String createMerchandise(String name,
String description, Decimal price, Double inventory) {
Merchandise__c m = new Merchandise__c(
Name=name,
Description__c=description,
Price__c=price,
Total_Inventory__c=inventory);
insert m;
return m.Id;
}
}