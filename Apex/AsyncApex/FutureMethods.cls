/*
- Runs in its own thread/transaction
- Executes when system resources are available

- Must be Static
- Must have Void return type
- Parameters must be primitive data types or 
  collection of primitive data type
*/

public class Myclass{
    @future
    public static void myFutureMethod(){
        System.debug('//Perform some operations');
    }
}