public class ContactSearch{
public static List<Contact> searchForContacts(String lastName,String postalCode){
Contact[] conts = [select ID,Name from Contact where LastName = :lastName and MailingPostalCode = :postalCode];
return conts;
}
}