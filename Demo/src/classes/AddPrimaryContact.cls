public class AddPrimaryContact implements Queueable  {
 private Contact contact;
 private String state;
    
    public AddPrimaryContact(Contact contact, String state){
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts =[select id from Account where BillingState = :state limit 200];
        List<Contact> contacts = new List<Contact>();
        for(Account acc : accounts){
            Contact con = contact.clone();
            con.AccountId =acc.id;
            contacts.add(con);
        }        
        insert contacts;
    }
}