public class dr_createuser {
    @InvocableMethod(label='Create User')
    public static void createUser(List<Id> usertemp){
        List<User> createUserList = new List<User>();
        Id CustomerroleId = [Select Id  From UserRole Where DeveloperName ='AUserCustomerPersonAccount' Limit 1].Id;
        Id CustomerProfileId = [Select Id From Profile Where Name ='DDFDG' Limit 1].Id;
		List<Account> storeAccount = [Select Id ,FirstName,LastName,PersonEmail,PersonContactId From Account Where Id =: usertemp];
        for(Account thisAccount: storeAccount){
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
            createUserList.add(thisUser);
        }
        if(!createUserList.isEmpty()){
            insert createUserList;
        }
    }
}