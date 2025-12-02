global class dr_ScheduleAcademicInterest implements Schedulable {
    global void execute(SchedulableContext sc){
        dr_AcademicInterestBatch thisdr_AcademicInterestBatch = new dr_AcademicInterestBatch();
        Database.executeBatch(thisdr_AcademicInterestBatch,5);
    }
}