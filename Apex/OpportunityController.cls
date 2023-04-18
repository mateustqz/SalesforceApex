public class OpportunityController {

    public static void updateProfile(List<Id> oppIds){
        List<Opportunity> opps = [SELECT Id, Amount, Profile__c FROM Opportunity WHERE Id IN: oppIds];
        for(Opportunity opp : opps){
            // get opp record
            if(opp.Amount == null){
                opp.Profile__c = 'Low';
            } else if(opp.Amount <10000){
                opp.Profile__c = 'Low';
            } else if (opp.Amount > 50000){
                opp.Profile__c = 'High';
            } else{
                opp.Profile__c = 'Medium';
            }
        }
        // update all item at once
        update opps;
    }
}
List<Opportunity> opps = new List<Opportunity>();
for(Integer i=0; i<200; i++){
    opps.add(new Opportunity(Name='Test Opp'+i, CloseDate=Date.today(), StageName='Qualification'));
}
insert opps;
