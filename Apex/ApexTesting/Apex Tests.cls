//Test Method Sintax
@isTest static void testName() {
    //CodeBlock
}

//Test Class with one Method
@isTest
private class MyTestClass {
    @isTest static void myTest() {
        //CodeBlock
    }
}
//Example of a Class and its Test Class
public class TemperatureConverter {
	//Takes a Fahrenheit temperature and returns the Celsius equivalent;
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}
-----//100%Coverage

@isTest
private class TemperatureConverterTest {
    @isTest static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        System.assertEquals(21.11,celsius);
    }
    @isTest static void testFreezingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(32);
        System.assertEquals(0,celsius);
    }
    @isTest static void testBoilingPoint() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(212);
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
    }
    @isTest static void testNegativeTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(-10);
        System.assertEquals(-23.33,celsius);
    }
}

//Example of a Class and its Test Class 2
public class TaskUtil {
    public static String getTaskPriority(String leadState) {
        //Validate input
        if(String.isBlank(leadState) || leadState.lenght() > 2) {
            return null;
        }
        String taskPriority;
        if(leadState = 'CA') {
            taskPriority = 'High';
        } else {
            taskPriority = 'Normal';
        }
        return taskPriority;
    }
}
-----
//100%Coverage
@isTest
private class TaskUtilTest {
    @isTest static void testTaskPriority() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEqual('Normal', pri);
    }
    @isTest static void testTaskHighPriority() {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    @isTest static void testTaskPriorityInvalid() {
        String pri = TaskUtil.getTaskPriority('TEST');
        System.assertEquals(null, pri);
    }
}

//Example of a Class and its Test Class 3
public class VerifyDate {
	//method to handle potential checks against two dates
	public static Date CheckDates(Date date1, Date date2) {
		//if date2 is within the next 30 days of date1, use date2. 
		// Otherwise use the end of the month
		if(DateWithin30Days(date1,date2)) {
			return date2;
		} else {
			return SetEndOfMonthDate(date1);
		}
	}
	//method to check if date2 is within the next 30 days of date1
	private static Boolean DateWithin30Days(Date date1, Date date2) {
		//check for date2 being in the past
        	if( date2 < date1) { return false; }
        
        	//check that date2 is within (>=) 30 days of date1
        	Date date30Days = date1.addDays(30); //create a date 30 days away from date1
		if( date2 >= date30Days ) { return false; }
		else { return true; }
	}
	//method to return the end of the month of a given date
	private static Date SetEndOfMonthDate(Date date1) {
		Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
		Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
		return lastDay;
	}
}
-----
@isTest 
public class TestVerifyDate {
    @isTest static void CheckDates1() {
        Date d1 = Date.newInstance(2020, 2, 15);
        Date d2 = Date.newInstance(2020, 2, 25);
        Date test = VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d2, test);
    }  
    @isTest static void CheckDates2() {
        Date d1 = Date.newInstance(2020, 2, 15);
        Date d2 = Date.newInstance(2020, 1, 15);
        Date d3 = Date.newInstance(2020, 2, 29);
        Date test = VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d3, test);
    } 
    @isTest static void CheckDates3() {
        Date d1 = Date.newInstance(2020, 2, 15);
        Date d2 = Date.newInstance(2020, 3, 20);
        Date d3 = Date.newInstance(2020, 2, 29);
        Date test = VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d3, test);
    }  
}


//Example of a Class and its Test Class 4
trigger AccountDeletion on Account (before delete) {
    //Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id FROM Account WHERE Id IN (SELECT AccountId FROM Opportunity) AND Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
    }
}

-----

@isTest
private class TestAccountDeletion {
    @isTest static void TestDeleteAccountWithOneOpportunity() {
        //Test data setup
        //Create an account with an opportunity, and then try to delete it
        Account acct = new Account(Name='Test Account');
        insert acct;
        Opportunity opp = new Opportunity(Name=acct.Name + 'Opportunity',
                                          StageName = 'Prospecting',
                                          CloseDate=System.today().addMonths(1),
                                          AccountId=acct.Id);
        insert opp;
        //Perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(acct, false);
        Test.stopTest();
        //Verify
        //In this case the deletion should have been stopped by the trigger,
        //so verify that we got back an error.
        System.assert(!result.isSuccess());
        System.assert(!result.getErrors().size() > 0);
        System.assertEquals('Cannot delete accout with related opportunities.', result.getErrors()[0].getMessage());
    }
}


//Example of a Class and its Test Class 5
@isTest
public class TestDataFactory {
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < numAccts; i++){
            Account a = new Account(Name = 'TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer j = 0; j < numAccts; j++) {
            Account acct = accts[j];
            //For each account just inserted, add opportunities
            for (Integer k = 0; k < numOppsPerAcct; k++) {
                opps.add(new Opportunity (Name = acct.Name + 'Opportunity' + k,
                                         StageName = 'Prospecting',
                                          CloseDate = System.today().addMonths(1),
                                          AccountId = acct.Id));
            }
        }
        //Insert all Opportunities for all accounts
        insert opps;
        return accts;
    }
}