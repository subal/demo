@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {

    @HttpGet
    global static Account getAccount(){
        RestRequest req = RestContext.request;
        String accId = req.requestURI.subStringBetween('Accounts/','/contacts');
        Account acc =[select Id,Name,(select Id,Name from Contacts) from Account where id=:accId];
        System.debug('acc' + acc);
        return acc;
    }
}