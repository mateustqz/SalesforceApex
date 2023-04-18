Integer totalSum = 0;
List<Integer> listOfNumbers = new List<Integer>();
for (Integer i = 1; i <= 10; i++){
    listOfNumbers.add(i);
}
System.debug(listOfNumbers);

for(Integer i = 1; 1 < 10; i++){
    if(Math.mod(listOfNumbers[i],2) == 0){
        totalSum = totalSum + listOfNumbers[i];
        System.debug(totalSum);
    }
}
---------------------------------------------------------------------
public class PracticeTest {
    public static List<Integer> getOddNumbers(){
        List<Integer> oddNumberList = new List<Integer>();
        List<Integer> oddNumberEven = new List<Integer>();
        Integer totalSum = 0;
        for(Integer i = 1; i <= 20; i++){
            if(Math.mod(i , 2) == 0){
                System.debug('Even Number: '+ i);
            }
            else{
                oddNumberList.add(i);
                System.debug('Odd Number: '+ i);
            }
        }
        System.debug('Odd Numers: ' + oddNumberList);
        for (Integer i = 0; i < oddNumberList.size(); i++){
            if(Math.mod(i, 2) == 0){
                oddNumberEven.add(oddNumberList[i]);
                totalSum = totalSum + oddNumberList[i];
            }
        }
        System.debug('Odd Numbers on Even Positions: ' + oddNumberEven);
        System.debug('Sum of them: ' + totalSum);
        return null;
    }
}

List<Integer> Example = new List<Integer>();
Example = PacticeTeste.getOddNumbers();

PracticeTest myTest = new PracticeTest();
Example = myTest.getOddNumbers();
----------------------------------------------------------------------------------------
public class Demo{
    public String helloWorldString;              //Instance Member Variable
    private static final String;                 //Static Member Variable

    Static{
        DEFAULT_STRING = 'Hello World';          //Static Initializer block
    }
    public demo(){                               //Constructor
        this.(DEFAULT_STRING); 
    }    
    public demo(String stringToDisplay){         //Overloaded Constructor
        this.helloWorldString = stringToDisplay;  
    }
    public void printOutput(){                              //Method
        System.debug('Display text: ' + helloWorldString);
    }
}

----------------------------------------------------------------------------------------------