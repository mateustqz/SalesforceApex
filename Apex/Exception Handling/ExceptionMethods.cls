System.debug('Before Exception');
try{
    //Math Exception
    Double result = 10/0;
    System.debug('Result: ' + result);
    System.debug('try block');
}catch(Exception e){
    system.debug('Cause: '+ e.getCause());
    system.debug('Message: '+ e.getMessage());
    system.debug('Cause: '+ e.getLineNumber());
    system.debug('Cause: '+ e.getStackTraceString());
}finally{
    system.debug('finally called');
}
system.debug('After Exception');