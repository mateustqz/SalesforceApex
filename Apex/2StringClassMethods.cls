String exp = 'i am a string variable ';
System.debug('Actual String: '+ exp);

System.debug('Capitalize String: '+ exp.capitalize());
System.debug('Contains ring?:' + exp.contain('ring'));
System.debug('Upper case: ' + exp.toUpperCase());
System.debug('Lower case: ' + exp.toLowerCase());
System.debug('Is equal to ring?: ' + exp.equals('ring'));

String str1 = 'Manish';
String str2 = 'maNish';
System.debug('str1 equals str2?: ' + str1.equals(str2));
System.debug('str1 equals str2 ignore case: ' + str1.toLowerCase().equals(str2.toLowerCase()));

System.debug('Remove ring: ' + exp.remove('ring'));
System.debug('Replace ring: ' + exp.replace('ring', 'rong'));
System.debug('Split by space: ' + exp.split(' '));

//String Scape Character
String str = 'My tem\'s name is \'SFDCFacts Academy\'. \n We work on apex.';
System.debug(str);
