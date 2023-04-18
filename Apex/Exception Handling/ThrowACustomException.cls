public class ThrowACustomException extends Exception{
    System.debug('Before Exception');
    try{
        throw new ProcessException('My custom exception');
    }catch(Exception e){
        system.debug('Cause: '+ e.getCause());
        system.debug('Message: '+ e.getMessage());
        system.debug('Cause: '+ e.getLineNumber());
        system.debug('Cause: '+ e.getStackTraceString());
    }finally{
        System.debug('finally called');
    }
    System.debug('After Exception');
}