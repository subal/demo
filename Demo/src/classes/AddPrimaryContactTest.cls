@isTest
private class AddPrimaryContactTest {

    @testSetup
    static void setup(){
        List<Account> accounts = new List<Account>();
        for(Integer i=0;i<50;i++){
            Account acc = new Account(name ='NY'+ i,BillingState='NY');
        	accounts.add(acc);
        }
    
    for(Integer i=0;i<50;i++){
            Account acc = new Account(name ='CA'+ i,BillingState='CA');
        	accounts.add(acc);
        }
        
        insert accounts;
        }
    
 static testmethod void testQueueable() {
     Contact con = New Contact(lastname='TestContcat');
     AddPrimaryContact updater = new AddPrimaryContact(con,'CA');
        Test.startTest();       
        System.enqueueJob(updater);
        Test.stopTest();       
        System.assertEquals(50, [select count() from Contact where Contact.Account.BillingState='CA']);

    }
    
}