public class BulkificationChallenge {
    
    //Challenge

    public static void updateAvgCaseResolutionDays(Id accountId){
        Integer totalDays = 0, totalCases = 0;
        for(Case caseObj : [SELECT Id, CreatedDate, ClosedDate FROM Case WHERE isClosed = true AND Id =:accountId]){
            totalCases++
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
        }
        Decimal resolutionDays = totalDays/totalCases;
        Account acc = new Account(Id=accountId, avg_Case_Resolution_Days__c = resolutionDays);
        update acc;
    }

    //My Solution:
    
	public static void updateAvgCaseResolutionDays(List<Id> accountIds){
        Integer totalDays = 0;
        List<Case> caseList = [SELECT Id, CreatedDate, ClosedDate FROM Case WHERE isClosed=true AND Id IN:accountIds];
        Integer totalCases = caseList.size();
        for(Case caseObj : caseList){
            totalDays += caseObj.CreatedDate.date().daysBetween(caseObj.ClosedDate.date());
        }
        Decimal resolutionDays = totalDays/(Decimal)totalCases;
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Id IN :accountIds];
        for(Account acc : accList){
            acc.avg_Case_Resolution_Days__c = resolutionDays;
        }    
        update accList;
    }
}