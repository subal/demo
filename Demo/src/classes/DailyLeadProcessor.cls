global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext sc){
        List<Lead> leads = [select id,LeadSource from Lead where LeadSource = null limit 200 ];
        List<Lead> leadsToUpdate = new List<Lead>();
        for(Lead le : leads){
            le.LeadSource = 'Dreamforce';
            leadsToUpdate.add(le);
        }
        
        update leadsToUpdate;
        
    }
}