trigger In_CaseTrigger on Case (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        In_CaseHandler.CaseCollector(Trigger.new);
    }
}