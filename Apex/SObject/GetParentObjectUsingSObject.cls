//retrieve all books and assign to a List collection
List<SObject> books = [SELECT Name, Price__c, Author__r FROM Book__c];
for(SObject book : books) {
    System.debug('Book Name: ' + String.valueOf(book.get('Name')) + 'Book Price: ' + (Decimal)book.get('Price__c') +  ' Book Author: ' + (String)book.getSObject('Author__r').get('Name'));
}