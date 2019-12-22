@RestResource(urlMapping = '/v1/JobApplication/')
global class JobPortal {
    @httpPost
    global static  Application__c createApplications(String name, String email,String address, String phone, String jobid, String applicant){
        Applicant__c app = new Applicant__c ();
        app.name =applicant;
        app.Email__c = email;
        app.Phone__c = phone;
        app.Address__c = address;
        insert app;     
        String id =   [select id,name from Job_Opening__c where Job_Id__c =: jobid][0].id;
        String applicantName =   [select id,name from Applicant__c where Name =: applicant][0].id;
        Application__c application = new Application__c(
            Name = name,
            Email__c = email,
            Phone__c = phone,
            Job_Id__c = id,
            Applicant__c = applicantName

        );
        insert application;
        return application;
        
    }
    
}