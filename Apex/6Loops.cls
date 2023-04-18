//Do While Loops
do{
    code_block
} while (condition);

//Example Do While
/* >A leap year is a year that is divisible by 4;
>Except if that is year is also divisible by 100.
> Unless the year is also evenly divisible by 400.
Print all leap years from 1100 to 2000*/
Integer year = 1100;
do{
    System.debug('Processing year '+ year);
    if(Math.mod(year, 4) == 0){     //Check if is divisible by 4
        if(Math.mod(year, 100) == 0){     //Check if is divisible by 100
            if(Math.mod(year, 400) == 0){     //Check if is divisible by 400
                System.debug(year + ' is a leap year');
            }
        } else{
            System.debug(year + ' is a leap year');
        }
    }
    year++;              //increment year
} while(year <= 2000);   //while condition

//Example 2 Do While
Integer count = 1;
do{
    System.debug(count);
    count++;
} while (count < 11);


//Example 3 Do While
Integer i = 0
do{
    if(Math.mod(i, 3) == 0 && Math.mod(i, 5) == 0){
        System.debug(i + ' Divisible by 3 and 5');
    }
    if(Math.mod(i, 3) == 0){
        System.debug(i + ' Divisible by 3');
    }
    if(Math.mod(i, 5) == 0){
        System.debug(i + ' Divisible by 5')
    }
    else {
        System.debug(i);
    }
    i++;
} while (i <= 100);

--------------------------------------------------------------------------

//While Loops
while (condition){
    code_block
}

//Example While Loop
Integer count = 1
while (count < 11){
    System.debug(count);
    count++;
}

//Example While Loop
Integer year = 1100;
while(year <= 2000){
    if(Math.mod(year, 4) == 0){
        if(Math.mod(year, 100) == 0){
            if(Math.mod(year, 400) == 0){
                System.debug(year + ' is a leap year');
            }
        } 
        else {
            System.debug(year + ' is a leap year');
        }
    }
    year++;
}

//Example While Loop
/*Print first 20 fibonacci numbers
0, 1, 1, 2, 3, 5, 8 …
0 & 1 - first 2 numbers
1 > 0+1
2 > 1+1
3 > 2+1
5 > 3+2
*/
Integer current;
Integer previous = 1;
Integer beforePrevious = 0;
System.debug(beforePrevious);
System.debug(Previous);
Integer i = 0;
while(i < 18){
    current = previous + beforePrevious;
    System.debug(current);
    beforePrevious = previous;
    previous = current;
    i++
}

---------------------------------------------------------------------------
//For Loops
//Traditional For Loop
for(init_statement; exit_condition; increment_statement){    
    code_block
}

//List or Set interation For Loop
for(variable : list_or_set){
    code_block
}

//SOQL For Loop
for(variable : [soql_query]){
    code_block
}

for(variable_list : [soql_query]){
    code_block
}


//For Loop Example
List<Integer> listOfNumbers = new List<Integer>();
Integer maxListSize = 6;
for(Integer i = 1; i <= maxListSize; i++){
    listOfNumbers.add(i);
}
/* The same of:
List<Integer> listOfNumbers = new List<Integer>();
listOfNumbers.add(1); 
listOfNumbers.add(2); 
listOfNumbers.add(3); 
listOfNumbers.add(4); 
listOfNumbers.add(5); 
listOfNumbers.add(6); */

//For Loop Example 2
for(Integer i = 0, j = 0; i < 10; i++){
    System.debug(i+1);
}

//For Loop Example 3
Integer[] myInts = new Integer[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
for (Integer i : myInts){
    System.debug(i);
}

//For Loop List Interation Example
List<String> days = new List<String>{'Monday', 'Tuesday', 'Wednerday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
for (String day : days){
    if(day == 'Tuesday'){
        continue;
    }
    System.debug('It is '+ day + '. Eat Chicken');
}