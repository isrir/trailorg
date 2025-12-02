public class dr_PastAcademicInterstBatch implements Database.Batchable<sObject>{
	
    public Database.QueryLocator start(Database.BatchableContext bc){
        Date tod = Date.Today();
        String Query = 'Select Id,Name,Status From AcademicInterest Where Application_Close_Date__c <'+ Tod;
        return Database.getQueryLocator(Query);
    }
    
    public void execute(Database.BatchableContext bc,List<AcademicInterest> tempAcademicInterest){
        List<AcademicInterest> updateAcademicInterest = new List<AcademicInterest>();
        for(AcademicInterest thisAcademicInterest : tempAcademicInterest){
            thisAcademicInterest.Status ='Lost';
            updateAcademicInterest.add(thisAcademicInterest);
        }
        if(!updateAcademicInterest.isEmpty()){
            update updateAcademicInterest;
        }
    }
    public void finish(Database.BatchableContext bc){
        
    }
}