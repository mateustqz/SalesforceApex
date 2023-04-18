@isTest
public class Covid19Test{
    @isTest
    public void generateCovid19(){
        Covid19 covidTest = new Covid19(10);
        covidTest.treatPacient();
        system.assertEquals(Covid19.recoveredInArea,11,'Test Error');
        system.assertEquals(Covid19.recoveredInCountry,11,'Test Error');
        covidTest.getTreated();
        covidTest.printTreated();
    }
}