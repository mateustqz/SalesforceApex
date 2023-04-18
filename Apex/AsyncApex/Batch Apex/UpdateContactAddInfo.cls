global class UpdateContactAddInfo implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(
            'SELECT id, BillingStreet, BillingCity, BillingState, BillingPostalCode, (SELECT id,    MailingStreet, MailingCity, MailingState, MailingPostalCode FROM Contacts) FROM Account WHERE BillingState=\'TX\''
        );   
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contacts> contacts = new List<Contacts>();
        for(Account account: scope){
            for(Contacts contact: account.contacts){
                contact.MailingStreet= account.BillingStreet;
                contact.MailingCity= account.BillingCity;
                contact.MailingState= account.BillingState;
                contact.MailingPostalCode= account.BillingPostalCode;
                contacts.add(contact);
            }
        }
        update contacts;
    }
    global void finish(Database.BatchableContext bc){

    }
}

//How to call the job(Batch Apex)
UpdateContactAddInfo updateContactObj = new UpdateContactAddInfo();
Database.executeBatch(updateContactObj);
 