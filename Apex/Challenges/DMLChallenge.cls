public class DMLChallenge{
    public static Account createAccount(){
        Account acc = new Account(Name = 'WingNut Films', Rating = 'Warm');
        insert acc;
        return acc;
    }
    public static Opportunity createOpportunity(Account acc){
        Opportunity opp = new Opportunity(Name = 'Lord Of The Rings', AccountId = acc.Id, StageName = 'Qualification', ClosedDate = TODAY());
        insert opp;
        return opp;
    }
    public static void updateAccount(Account acc){
        acc.Name = 'New Line Cinema';
        update acc;
    }
    public static void updateOpportunity(Opportunity opp){
        opp.StageName = 'Closed Won';
        update opp;
    }
    public static void deleteUndelete(Opportunity opp){
        
        delete opp;
        List<Opportunity> deletedOpps = [SELECT Id, Name, Phone FROM Opportunity WHERE isDeleted = True ALL ROWS];
        undelete deletedOpps;
    }
}