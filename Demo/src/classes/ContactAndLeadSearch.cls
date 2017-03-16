public class ContactAndLeadSearch{

public static List<List<SObject>> searchContactsAndLeads(String text){

return [FIND :text IN ALL FIELDS RETURNING Lead(firstName,lastname where lastname='Smith'),Contact(FirstName,LastName where lastname='Smith')];

}
}