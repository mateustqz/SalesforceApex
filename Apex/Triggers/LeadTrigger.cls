trigger LeadTrigger on Lead(before insert) {
    //System.debug('Lead trigger called');
    for(Lead leadRecord : Trigger.new){
        if(String.isBlank(leadRecord.LeadSource)){
            leadRecord.LeadSource = 'Other';
        }
    }
}