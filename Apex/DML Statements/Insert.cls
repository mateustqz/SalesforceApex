List<Account> accounts = new List<Account>();
Account acc1 = new Account(Name = 'xxxx');
accounts.add(new Account(Name = 'xxx2'));

insert accounts;//Doesn't allow partial success of DML operation. If any record fails, complete transactions will be rolled back and none of the records will be saved.(Partial Success Not Allowed)

//or

//Database.insert(recordsToInsert, allOrNone);
Database.insert(accounts, false);//Will create the success and what fail will be descarted.(Partial Success Allowed).

Database.insert(accounts, true);//Will create all records, or none.(Partial Success Not Allowed).

Database.SaveResult[] saveResultList = Database.insert(accList, false); //Inserts and Creates a Set of the inserted and faild accounts.


