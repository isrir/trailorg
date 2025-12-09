trigger dr_AcademicInterestTrigger on AcademicInterest (after update) {
    if(Trigger.isUpdate){
        dr_AcademicInterestHandler.submitforApprovalProccess(Trigger.new);
    }
}