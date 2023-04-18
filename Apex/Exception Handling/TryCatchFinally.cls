//EXP 1
//You should set the exception you need to be caught
try{
    //Math Exception
    Double result = 10/0;
    System.debug('Result: ' + result);
}catch(MathException e){
    system.debug('caught exception');
}finally{
    system.debug('finally called');
}

//EXP 2
//You can use as many catch as you need to catch exception
try{
    //DML Exception
    Account accRec = new Account();
    insert accRec;
}catch(MathException e){
    system.debug('caught dml exception');
}catch(DMLException e){
    system.debug('caught dml exception');
}finally{
    system.debug('finally called');
}

//EXP 3 - Melhor Jeito
//Or you can just put 'Exception' that will catch any exception
try{
    //DML Exception
    Account accRec = new Account();
    insert accRec;
}catch(Exception e){
    system.debug('caught exception');

}finally{
    system.debug('finally called');
}