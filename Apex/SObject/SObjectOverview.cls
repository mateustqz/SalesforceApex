public class SObjectOverview{
    public static List<Book__c> getBooks(){
        List<Book__c> books = [SELECT Name, Price__c FROM Book__c];
        for(Book__c book : books){
            System.debug('Book Name: ' +book.Name + ' Book Price: ' + book.Price__c);
        }
        return getBooks;
    }
    //or

    public static List<SObject> getBooks2(){
        List<SObject> books = [SELECT Name, Price__c FROM Book__c];
        for(SObject book : books){
            //Get method returns an Object value, which must be changed to a primitive datatype

            //String Name = (String)book.get('Name');
           // Decimal Price__c = (Decimal)book.get('Price__c');

            System.debug('Book Name: ' + book.get('Name') + 'Book Price: ' + book.get('Price__c')); //Apesar de retornar um objeto, por estar dentro do sysdebug o proprio apex transforma para string datatype. Logo, desta forma vai dar certo...

            //Porem para transformar para string: 
            // - String.valueOf(); ou Decimal.valueOf(); ou ...
            // - (String) ou (Decimal) ou ... antes da variavel
            System.debug('Book Name: ' + String.valueOf(book.get('Name')) + 'Book Price: ' + (Decimal)book.get('Price__c'));

            return getBooks2;
        }
    }
}


