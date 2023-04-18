public class Demo3 {
    public void mainValueMethod(){
        String websiteUrl = 'www.apexhours.com';
        System.debug('Before value call '+ websiteUrl);
        passByValueCall(websiteUrl);
        System.debug('After vakue call '+ websiteUrl);
    }
    private void passByValueCall(String websiteUrlValue){   //Pass By Value Call
        websiteUrlValue = 'www.salesforce.com';   
    }

    public void mainReferenceMethod(){
        Account a = new Account();
        a.Name = 'Test Name';
        a.Website = 'www.apexhours.com';
        System.debug('Before call reference '+ a);
        passByReferenceCall(a);
        System.debug('After call reference '+a);
    }
    private void passByReferenceCall(Account a){           //Pass By Reference Call
        a.Website = 'www.salesforce.com';
    }
}