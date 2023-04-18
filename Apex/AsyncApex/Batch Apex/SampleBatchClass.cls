public class SampleBatchClass implements Database.Batchable<Account>{
    public Database.QueryLocator start(Database.BatchableContext BC){
        //Batch scope in this method
        string query = 'SELECT Id, Name FROM Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Account> scope){
        //Process each chunk of records in this method
        for (Account acc: scope){
            acc.Rating = 'Hot';
        }
        update scope;
    }
    public void finish(Database.BatchableContext BC){
        //Do final processing in this method
        //like sending an email or calling another batch class
    }
}
-----------------------------------------------------------
//HOW TO CALL
//Create a Batch instance
SampleBatchClass batchInstance = new SampleBatchClass();

//Execute batch with batch size 50.
Id batchJobId = Database.executeBatch(batchInstance, 50);
//1º Param = Batch Instance. 
//2º Param = Optional scope parameter. Scope value must be greater than 0 and can be max 2000. Default value is 200.

//Schedule Batch
String cronID = System.scheduleBatch(batchInstance, 'My Sample Job', 30);
//1º Param = Batch Instance
//2º Param = Batch Job Name
//3º Param = Minutes From Now
