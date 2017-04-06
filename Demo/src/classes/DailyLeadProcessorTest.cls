@isTest
public class DailyLeadProcessorTest {
    
//List<Lead> leads = new List<Lead>();
public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
 /*    @testSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0;i < 200 ;i++){
            leads.add(new Lead(LastName='MyLead '+ i,Company='CG'));
        }
        
         insert leads;
        //List<Id> ids= new List<Id>();
       // ids =leads;
           
    } */
    
    static testmethod void test(){
         List<Lead> leads = new List<Lead>();
        for(Integer i=0;i < 200 ;i++){
            leads.add(new Lead(LastName='MyLead '+ i,Company='CG'));
        }
        
        insert leads;
        
        Map<ID,Lead> ledMap = new Map<ID,Lead>(leads);
        List<Id> ids= new List<ID>(ledMap.keySet());
        system.debug('created ids: '+ ids.size());        
         Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());
        
        List<Task> lt = [SELECT Id
            FROM Task
            WHERE WhatId IN :ids];
        System.assertEquals(0, lt.size(), 'Tasks exist before job has run');
        Test.stopTest();
        List<Task> taskIds = [select id from Task WHERE WhatId IN :ids];
        System.debug('ids: ' +ids.size() + '  TaksIds: ' +taskIds.size());
        //System.assertEquals(ids.size(),taskIds.size(),'Job not created');
        
    }
}