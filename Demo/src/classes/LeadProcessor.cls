global class LeadProcessor implements Database.Batchable<sObject> {
    
    global Integer recordProcessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('select id,LeadSource from Lead');
    }

    global void execute(Database.BatchableContext bc,List<Lead> scope){
        List<Lead> leadsToUpdate = new List<Lead>();
        for(Lead led:scope){
            led.LeadSource ='Dreamforce';
            leadsToUpdate.add(led);  
            recordProcessed = recordProcessed + 1;
        }
		update leadsToUpdate;        
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Total no of records processed: '+ recordProcessed);
    }
}