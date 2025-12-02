global class dr_AcademicInterestBatch implements DataBase.Batchable<sObject>{
    
    global DataBase.QueryLocator start(DataBase.BatchableContext bc){
        Date thisToday = Date.Today();
        Date reducedDate= thisToday.addDays(5);
        String recordToQuery = 
            'SELECT Id, Name, AccountId,Contact.Name, ContactId,Contact.Email, Status, Application_Close_Date__c, LearningProgramId, AcademicTermId,LearningProgram.Name ' +
            'FROM AcademicInterest ' +
            'WHERE IsClosed__c = false AND Application_Close_Date__c < :reducedDate And ContactId != NULL';
        
        return DataBase.getQueryLocator(recordToQuery);
    }
    
    global void execute(DataBase.BatchableContext bc, List<AcademicInterest> thisAcademicInterest){
        
        System.enqueueJob(new dr_QueuableAcademicInterest(thisAcademicInterest));
    }
    
    global void finish(DataBase.BatchableContext bc){
    }
}