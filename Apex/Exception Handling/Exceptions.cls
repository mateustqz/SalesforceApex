//Math Exception 
Double result = 10/0;
System.debug('Result: ' + result);

//DML Exception  (Account.Name is required)
Account accRec = new Account();
insert accRec;

//Null Pointer Exception
String str;
System.debug(str.toLowerCase());

//throw an exception Programmatically
throw new NullPointerException();