//get all accounts to delete
List<Account> accounts = [SELECT Id FROM Account WHERE Name LIKE 'Test Account%'];

//delete using dml statement
delete accounts;

//delete using database methods
Database.delete(accounts); 


-----------------------------
//Undelete

//get deleted account records
List<Account> deletedAccounts = [SELECT Name, Phone FROM Account WHERE isDeleted = true ALL ROWS];

//undelete records
undelete deletedAccounts;