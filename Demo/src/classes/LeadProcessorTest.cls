@isTest
private class LeadProcessorTest {
	
    @testSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i < 200 ;i++){
            leads.add(new Lead(LastName='MyLead '+ i,Company='CG'));
        }
        
        insert leads;
    }
    
    static testMethod void test(){
        Test.startTest();
        LeadProcessor leadProcessor = new LeadProcessor();
        Id jobId = Database.executeBatch(leadProcessor);
        Test.stopTest();
        System.assertEquals(200,[select count() from Lead where LeadSource ='Dreamforce']);
    }
}