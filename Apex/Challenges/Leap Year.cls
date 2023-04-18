//A leap year has 366 days.
//Write a program to find out if a year is a leap year or not.

public class LeapYearChallenge {
    public void checkIfLeap(Integer year) {
        if(Math.mod(year, 4) == 0){
            if(Math.mod(year, 100) == 0){
                if(Math.mod(year, 400) == 0){
                    System.debug(year + ' is a leap year');
                } 
                else {
                    System.debug(year + ' not a leap year');
                }
            } 
            else {
                System.debug(year + ' is a leap year');
            }
        }
        else {
            System.debug(year + ' not a leap year');
        }
    }
}

//Improve
public class LeapYearChallenge {
    public List<Integer> insertLeapYears(Integer since, Integer until) {
        
        List<Integer> years = new List<Integer>();
        List<Integer> leapYears = new List<Integer>();
       
        for(Integer i = since; i <=until; i++){
            years.add(i);
        }
        
        for(Integer year : years){
            if(Math.mod(year, 4) == 0){
            	if(Math.mod(year, 100) == 0){
                	if(Math.mod(year, 400) == 0){
                    	//System.debug(year + ' is a leap year');
                        leapYears.add(year);
                	} 
               		else {
                    	//System.debug(year + ' not a leap year');
                    	continue;
                	}
            	} 
            	else {
                	//System.debug(year + ' is a leap year');
                    leapYears.add(year);
           		}
        	}
        	else {
            	//System.debug(year + ' not a leap year');
                continue;
        	}
        }
	return leapYears;     
    }
}