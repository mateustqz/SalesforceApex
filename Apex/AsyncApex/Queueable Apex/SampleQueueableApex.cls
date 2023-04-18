public class SampleQueueableClass implements Queueable{
    public void execute(QueueableContext context){
        //Write all Asynchronous code here
        //you can chain other queueable classes as well
        List<Lead> existingRecords = [SELECT Id, Name FROM Lead];
        for(Lead record : existingRecords){
            record.leadSource = 'Web';
        }
        update existingRecords;
    }
}
--------
SampleQueueableClass sample = new SampleQueueableClass();
//enqueue the job for processing
ID jobID = System.enqueueJob(sample);