public class testcreateuser {
    public static void createuser(){
        String PersonAccountId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Person Account').getRecordTypeId();
        Account thisAccount = new Account();
        thisAccount.RecordTypeId  = PersonAccountId;
        thisAccount.FirstName ='Testing';
        thisAccount.LastName ='userr1';
        thisAccount.PersonEmail = 'bivas17916@idwager.com';
        insert thisAccount;
    }
    public static void usercr(){
        Id CustomerroleId = [Select Id  From UserRole Where DeveloperName ='AUserCustomerPersonAccount' Limit 1].Id;
        Id CustomerProfileId = [Select Id From Profile Where Name ='DDFDG' Limit 1].Id;
		Account thisAccount = [Select Id ,FirstName,LastName,PersonEmail,PersonContactId From Account Where LastName ='userr1' Limit 1];
		
        User thisUser = new User();
        thisUser.FirstName = thisAccount.FirstName +1 ;
        thisUser.LastName = thisAccount.LastName;
        thisUser.Alias =  String.valueof(thisAccount.FirstName).subString(0,2);
        thisUser.Email = thisAccount.PersonEmail;
        thisUser.Username = thisAccount.LastName+'@cretic.com';
        thisUser.UserRoleId = CustomerroleId;
        thisuser.ProfileId =CustomerProfileId;
        thisUser.EmailEncodingKey ='UTF-8';
        thisUser.LocaleSidKey ='en_US';
        thisUser.LanguageLocaleKey='en_US';
        thisUser.TimeZoneSidKey='America/New_York';
        thisUser.ContactId = thisAccount.PersonContactId;
        thisUser.IsActive =False;
        insert thisUser;
        
    }
}