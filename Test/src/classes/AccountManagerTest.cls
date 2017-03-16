@IsTest
private class AccountManagerTest {
    
     @isTest 
     static void testgetAccount(){
        Id accId = createAccount();
        RestRequest req = new RestRequest();
        req.requestURI = 'https://ap1.salesforce.com/services/apexrest/Accounts/'+accId+'/contacts';
        RestContext.request= req;
        
        Account acc = AccountManager.getAccount();
        System.assert(acc != null);
        System.assertEquals('Subal', acc.Name);
    }
    
    @isTest static Id createAccount(){
        // Create test record
        Account TestAcc = new Account(
          Name='Subal');
        insert TestAcc;
        Contact TestCon= new Contact(
        LastName='Test', 
        AccountId = TestAcc.id);
        return TestAcc.Id;
    }      
}