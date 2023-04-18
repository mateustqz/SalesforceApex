//create a new account sobject instance
SObject accountRec = (SObject)Type.forName('Account').newInstance();
accountRec.put('Name', 'Sample SObject Account');
accountRec.put('Phone', '7697890786');

insert accountRec;