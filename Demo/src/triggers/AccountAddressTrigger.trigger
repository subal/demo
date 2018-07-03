trigger AccountAddressTrigger on Account (before insert,before update) {
//match postal code
for(Account a : Trigger.New) {
    if(a.Match_Billing_Address__c == true && a.BillingPostalCode != ''){
        a.ShippingPostalCode = a.BillingPostalCode;
    }
    } 
}