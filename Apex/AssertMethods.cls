//System.assert(Boolean condition); There is no error msg;
System.assert(a == b);

//System.assert(Boolean condition, 'Error msg');
System.assert(a == b, 'A is not equal to B.');

//System.assertEquals(Expected Value, Actual Value);
System.assertEquals(a, b);

//System.assertEquals(Expected Value, Actual Value, 'Error message');
System.assertEquals(a, b, 'A is not equal to B');

//System.assertNotEquals(Not Expected Value, Actual Value)
System.assertNotEquals(a, b); //if A is equals to B will fail
System.assertNotEquals(a, b, 'Error message');
