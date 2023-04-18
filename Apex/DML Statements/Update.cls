List<Account> accounts = [SELECT id, name, phone FROM Account WHERE name = 'SFDCFacts'];
for(Account acc : accounts){
    acc.Name = 'SFDCFacts Academy';
}

update accounts;
//or
Database.update(accounts, false);
//Database.update(accounts, allOrNone);
//You need de ID to update a record; 

