public class LeadAsynchronous{
    @future //future methods only accepts primitive datatypes
    public static void updateLeadRecords(List<Id> existingRecordIds){  //thats why i used the id list and then fill the leads list; 
        List<Lead> existingRecords =[SELECT Id, LeadSource FROM Lead WHERE Id IN :existingRecordIds]; //A lead isn't a primitive datatype; 
            for(Lead record : existingRecords){
                record.LeadSource = 'Web';
            }
            update existingRecords;
    }
    @future
    public static void createLeadRecords(){
        Lead anotherLead = new Lead(LastName = 'Test Lead Single', Status = 'Open - Not Contacted', Company = 'SFDCFacts')
    }
}