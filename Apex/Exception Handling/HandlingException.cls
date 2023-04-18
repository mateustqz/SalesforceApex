//If you thing one part of the code will throw an exception, 
//you should put it in the Try block.
System.debug('Before Exception');
try{
    Integer i = 10/0;
    //throws an exception
}catch(MathException e){       //Catch block only executes if the exception was 
    //catch exception here       thrown in Try block and matches it's exception type.

}finally {                      //Finally block always executes regardless of whether
    //optional finally block      an exception was thrown.
}
System.debug('After Exception');

//You can define multiple catch blocks but there can be 
//only one finally block per try block