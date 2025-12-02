public class dr_QueuableAcademicInterest implements Queueable {
    public List<AcademicInterest> storeAcademicInterest;
    public dr_QueuableAcademicInterest(List<AcademicInterest> collectedAcademicInterest){
        this.storeAcademicInterest = collectedAcademicInterest;
    }
    public void execute(QueueableContext sc){
        List<Messaging.SingleEmailMessage> listSingleEmail = new List<Messaging.SingleEmailMessage>();
        for(AcademicInterest temp :storeAcademicInterest ){ 
            String emailSubject =  'Remainder For Application Registration '+ temp.LearningProgram.Name;
            String emailBody ='Hi '+ temp.Contact.Name +' \n Deadline of Learning Program :'+ temp.Application_Close_Date__c +'\n kindly Update';
            String[] emailAddress = new String[]{temp.Contact.Email};
            Messaging.SingleEmailMessage thisSingleEmail = new Messaging.SingleEmailMessage();
            thisSingleEmail.setToAddresses(emailAddress);
            thisSingleEmail.setSubject(emailSubject);
            thisSingleEmail.setPlainTextBody(emailBody);
            
            listSingleEmail.add(thisSingleEmail);
        }
        if(!listSingleEmail.isEmpty()){
            Messaging.sendEmail(listSingleEmail);
        }
    }
}