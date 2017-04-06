public class AddMultipleAccounts {
Account account= new Account();
    public List<Account> acclist {get;set;}
    
    public AddMultipleAccounts(){
        acclist = new List<Account>();
        acclist.add(account);
    }
    
    public void addAccount(){
        Account acc = new Account();
        accList.add(acc);
           }
    public PageReference saveAccount(){
        insert acclist;
        return null;
    }
}