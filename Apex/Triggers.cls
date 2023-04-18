//Triggers
trigger TriggerName on ObjectName (trigger_events){
    code_block;
}
//trigger_events = before/after insert; before/after update; before/after delete; after undelete;
//Example
trigger HelloWorldsTrigger on Account (before insert){
    System.debug('Hello World');
}
----------------------------
Account a = new Account(Name = 'Test Trigger');
insert a;

//Example 2
trigger HelloWorldTrigger on Account (before insert){
    for(Account a : Trigger.New){
        a.Description = 'New Description';
    }
}
//This example iterates over each account in a for loop  and updates the Description for each.
/* Trigger.New = contains all records that were inserted in insert or update triggers;
   Trigger.Old = provides de old version of sObjects before they were updated in update triggers,
   or a list of deleted sObjects in delete triggers. */

//example 3
trigger ContextExampleTrigger on Account (before insert, after insert, after delete){
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            //Process before insert
        }
        else if(Trigger.isAfter){
            //Process after insert       
        }
    }
    else if(Trigger.isDelete){
        //Process after delete
    }
}
//Example 4 -- Calling a Class Method From a Trigger
trigger ExampleTrigger on Contact(after insert, after delete){
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        //Call a utility method from another class
        EmailManager.sendEmail('Your email adress', 'Trailhead Trigger Tutorial',
                                recordCount + 'Contacts were inserted');
    }
    else if(Trigger.isDelete){
        //Process After Delete
    }
}

//Example 5 -- Adding Related Records
trigger AddRelatedRecord on Account(after insert, after update){
    List<Opportunity> oppList = new List<Opportunity>();

    //get the related opportunities for the accounts in this trigger
    Map<Id, Account> acctsWithOpps = new Map<Id, Account>(
        [Select Id, (Select id from opportunities) from Account where Id in :Trigger.New]);


    //Add an opportunity for each account if it doesn't already have one.
    //Interate throught each account.
    for(Account a : Trigger.New){
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size() = ' 
        + acctsWithOpps.get(a.Id).Opportunities.size());

        if(acctsWithOpps.get(a.Id).Opportunities.size() == 0){
            oppList.add(new Opportunity(Name = a.Name + ' Opportunity',
                                        StageName = 'Prospecting',
                                        CloseDate = System.today().addMonths(1),
                                        AccountId = a.Id));
        }
    } 
    if(oppList.size() > 0){
        insert oppList;
    }
}

//Example 6 -- Using Trigger Exceptions
trigger AccountDeletion on Account (before delete) {
    //Prevent the deletion of accounts if they have related opportunities.
    for(Account a :[SELECT Id FROM Account
                    WHERE Id IN (SELECT AccountId FROM Opportunity) and
                    Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.';)
    }
}

//Example 7 -- Triggers and Callouts
public class CalloutClass {
    @future(callout = true)
    public static void makeCallout() {
        HttpRequest request = new HttpRequest();
        //Set the endpoint URL
        String endpoint = 'http://yourHost/yourService';
        request.setEndPoint(endpoint);
        //Set the Http verb to GET
        request.setMethod('GET');
        //Send the Http request and get the response.
        HttpResponse response = new HTTP().send(request);
    }
}

trigger CalloutTrigger on Account(before insert, before update) {
    CalloutClass.makeCallout();
}

//Example 8 -- Not Bulk AND Bulk Triggers
trigger MyTriggerNotBulk on Account(before insert) {
    Account a = Trigger.New[0];
    a.Description = 'New description';
}

trigger My TriggerBulk on Account(before insert) {
    for(Account a :Trigger.New) {
        a.Description = 'New description';
    }
}

//Example 9 -- Performing Bulk SOQL
trigger SoqlTriggerBulk on Account(after update) {
    //Perform SOQL query once.
    //Get the accounts and their related opportunities.
    List<Account> acctsWithOpps = [Select Id, (Select Id, Name, ClosedDate From Opportunities)
                                    From Account Where Id IN :Trigger.New];
    
    //Iterate over the returned accounts
    for(Account a : acctsWithOpps) {
        Opportunity[] relatedOpps = a.Opportunities;
    }
}

//Example 10
trigger SoqlTriggerBulk on Account(after update) {
    //Perform SOQL query once.
    //Get the related opportunities for the accounts in this trigger.
    List<Opportunity> relatedOpps = [Select Id, Name, CloseDate From Opportunity
    Where AccountId IN :Trigger.New];

    //Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {
        //Do some other processing
    }
}

//Example 11 => example 9 and 10 enhanced
trigger SoqlTriggerBulk on Account(after update) {
    //Perform SOQL query once.
    //Get the related opportunities for the accounts in this trigger,
    // and iterate over those records.
    for(Opportunity opp : [Select Id, Name, CloseDate From Opportunity
                            Where AccountId IN :Trigger.New]) {
        //Do some other processing
    }
}

//Example 12 - Ineficient Bulk DML
trigger DmlTriggerNotBulk on Account(after update) {
    //Get the related opportunities for the accounts in this trigger.
    List<Opportunity> relatedOpps = [Select Id, Name, Probability From Opportunity 
                                        Where AccountId IN :Trigger.New];
    //Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {
        //Update the description when probability is greater
        // than 50% but less than 100%
        if((opp.Probability >= 50) && (opp.Probability < 100)) {
            opp.Description = 'New description for opportunity.';
            //Update once for each opportunity -- not efficient!
            update opp;
        }
    }
}

//Example 13 -- Perform DML in bulk Efficiently
trigger DmlTriggerBulk on Account(after update) {
    //Get the related opportunities for the accounts in this trigger.
    List<Opportunity> relatedOpps = [Select Id,Name,Probability From Opportunity 
                                        Where AccountId IN :Trigger.New];
    List<Opportunity> oppsToUpdate = new List<Opportunity>();
    //Iterate over the related opportunities
    for(Opportunity opp : relatedOpps) {
        //Update the description when probability is greater
        // than 50% but less than 100%
        if((opp.Probability >= 50) && (opp.Probability < 100)){
            opp.Description = 'New description for Opportunity.';
            oppsToUpdate.add(opp);
        }
    }
    //Perform DML on a collection
    update oppsToUpdate
}

//Example 14 -- Enhancing AddRelatedRecord Trigger
trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    //Add an opportunity for each account if it doesn't already have one;
    //Iterate over accounts that are in this trigger but that don't have opportunities;
    for(Account a : [SELECT Id,Name FROM Account
                    WHERE Id IN :Trigger.New AND
                    Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        //Add a default opportunity for this account;
        oppList.add(new Opportunity(Name = a.Name + 'Opportunity',  
                                    StageName = 'Prospecting',
                                    CloseDate = System.today().addMonths(1),
                                    AccountId = a.Id));
    }
    if (oppList.size() > 0) {
        insert oppList;
    }
}

//Example 15
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> taskList = new List<Task>();
	for(Opportunity opp: [SELECT Id,Name FROM Opportunity	
                          WHERE StageName='Closed Won']) {
        taskList.add(new Task (Subject = 'Follow up Test Task',	
                                WhatId = opp.Id));
   	}
    if (taskList.size() > 0) {
        insert taskList;
    }
}