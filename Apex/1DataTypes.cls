public class ApexDataTypes{
    public static void dataTypeExamples(){
        String o = 'Hello World';                                        //String   
        System.debug('String: '+ o);                                     
        System.debug('Blob: '+ Blob.valueOf(o));                         //Blob
        //Blob transforma pra binário
        //Binario(101001) != Boolean(true, false)

        Boolean isActive = true;
        System.debug('Boolean: '+ isActive);                             //Boolean
        System.debug('Date: '+ Date.newInstance(2020, 01, 18));          //Date

        Datetime currentDateTime = Datetime.now();
        System.debug('Datetime: '+ currentDateTime);                     //Datetime    
        System.debug('Time: '+ Time.newInstance(22, 40, 36, 03));        //Time

        Decimal decValue = 25.05;
        System.debug('Decimal: '+ decValue);                             //Decimal
        
        Id recordId = [Select Id From Account Limit 1][0].Id;
        System.debug('ID: '+ recordId);                                  //ID

        Integer intValue = 25;
        System.debug('Integer: '+ intValue);                             //Integer

        Long longValue = 8372564937L;
        System.debug('Long: '+ longValue);                               //Long

        Object objValue = o;
        System.debug('Object: '+ objValue);                              //Object 
    }

    public static void dataTypeConversion(){
        String physicsMarks = '72';
        String chemistryMarks = '64';
        String mathMarks = '87';

        String total = String.valueOf(
            Integer.valueOf(physicsMarks) +
            Integer.valueOf(chemistryMarks) +
            Integer.valueOf(mathMarks)
        );
    }
}