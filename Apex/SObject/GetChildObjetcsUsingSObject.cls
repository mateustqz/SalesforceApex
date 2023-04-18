Account acc = new Account(Name= 'Acme', Description = 'Acme Account');
insert acc;
Contact con = new Contact(Lastname = 'AcmeCon', AccountId = acc.id);
insert con;
SObject[] a = [SELECT Id, (SELECT Name FROM Contacts LIMIT 1) FROM Account WHERE id = :acc.id];
SObject[] contactsDB = a.get(0).getSObjects('Contacts');
String fieldValue = (String)contactsDB.get(0).get('Name');
System.assertEquals('AcmeCon', fieldValue);