@isTest
public class dr_PastAcademicInterstBatchTest {
    @isTest static void academicClosure(){
        String PersonAccountId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        Account thisAccount = new Account();
        thisAccount.RecordTypeId  = PersonAccountId;
        thisAccount.LastName ='Testing Kid';
        insert thisAccount;
        
        Learning thisLearning = new Learning();
        thisLearning.Name ='KIT CSE';
        thisLearning.ProviderId = thisAccount.Id;
        thisLearning.ActiveFromDate = Date.Today().addDays(-20);
        thisLearning.ActiveToDate = Date.Today().addDays(+15);
        insert thisLearning;
        
        LearningProgram thisLearningProgram = new LearningProgram();
        thisLearningProgram.LearningId = thisLearning.Id;
        thisLearningProgram.Name = 'KIT CSE Learning Program';
        insert thisLearningProgram;
        
        AcademicTerm thisAcademicterm = new AcademicTerm();
        thisAcademicterm.Name = 'KIT Summer 2026';
        thisAcademicterm.IsActive = True;
        thisAcademicterm.RegistrationOpenDate = Date.Today().addDays(-20);
        thisAcademicterm.RegistrationCloseDate = Date.Today().addDays(-3);
        thisAcademicterm.StartDate = Date.Today().addDays(2);
        thisAcademicterm.EndDate = Date.Today().addDays(20);
        thisAcademicterm.LateRegistrationDate = Date.Today();
        insert thisAcademicterm;
        
        
        List<AcademicInterest>  listAcademicInterest = new List<AcademicInterest>();
        for(Integer i=1;i<=100;i++){
            AcademicInterest thisAcademicInterest = new AcademicInterest(); 
            thisAcademicInterest.AccountId = thisAccount.Id;
            thisAcademicInterest.AcademicTermId = thisAcademicterm.Id;
            thisAcademicInterest.LearningProgramId = thisLearningProgram.Id;
            thisAcademicInterest.Subscription = 'Hi'+i;
            listAcademicInterest.add(thisAcademicInterest);
        }
        if(!listAcademicInterest.isEmpty()){
            insert listAcademicInterest;
        }
        
        test.startTest();
        dr_PastAcademicInterstBatch thisdr_PastAcademicInterstBatch = new dr_PastAcademicInterstBatch();
        Database.executeBatch(thisdr_PastAcademicInterstBatch);
        test.stopTest();        
        List<AcademicInterest> updateAcademicInterest = [SELECT Id,Name,Status From AcademicInterest Where Status = 'Lost'];
        System.debug(updateAcademicInterest);
        System.Assert.areEqual(100, updateAcademicInterest.size());
    }
}