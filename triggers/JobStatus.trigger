trigger JobStatus on Job_Opening__c (after update) {
    List<Application__c> li2 = new List<Application__c>();
    if(RecursiveTriggerHandler.isFirstTime){
        RecursiveTriggerHandler.isFirstTime = false;   
        for(Job_Opening__c job : Trigger.new)
        {
            if(!job.Job_Status__c){
                for(Job_Opening__c app : [select id, Name, Job_Status__c,(select Job_Id__c,Status__c, Name from Applications1__r ) from Job_Opening__c where Job_Status__c = false] ){
                    for(Application__c cn : app.Applications1__r){                    
                        cn.Status__c = false;
                    } 
                    
                    update app.Applications1__r;
                }                                         
            }  
        }
    }
}