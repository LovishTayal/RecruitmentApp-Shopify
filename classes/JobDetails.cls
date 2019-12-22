/**
* @author      Lovish Tayal
* @date        22-Dec-2019
* @description 
* 22-Dec-2019  - Lovish Tayal - creation and inital commit                       
*/

public class JobDetails {
    @AuraEnabled
    public static List<Job_Opening__c> getJobDetails(){
       Id recId =  Schema.Sobjecttype.Job_Opening__c.getRecordTypeInfosByName().get('Internal Department').getRecordTypeId();
        List<Job_Opening__c> jobList = [select id, Name, Job_Id__c, Required_Qualification__c, Job_Status__c, Designation__c, Salary__c, RecordTypeId  from Job_Opening__c where Job_Status__c = true and RecordTypeId =: recId];
        return jobList;
    }
}