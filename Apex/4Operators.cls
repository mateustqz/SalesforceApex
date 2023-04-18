Integer x = 5;        // assignment operator
x = x + 5;            // addition operator
x = x - 5;            // Subtraction operator
x = x * 5;            // multiplication operator
x = x / 5;            // division operator
x++;                  //increment operator (x = x + 1)
x--;                  //decrement operator (x = x - 1)
x += 5;               // addition assignment operator (x = x + 5)
x -= 5;               // subtraction assignment operator (x = x - 5)
x *= 5;               // multiplication assignment operator (x = x * 5)
x /= 5;               // division assignment operator (x = x / 5)


Boolean first = true;
Boolean second = false;
Boolean result;
result = first && second;   //AND Operator
System.debug(result);

result = first || second;   //OR Operator
System.debug(result);

result = (first == second); //Equality Operator
System.debug(result);
result = ('Hello' == 'World');
System.debug(result);

result = (5 < 6);           //Less than Operator
result = (5 > 6);           //Greater than Operator
result = (5 <= 6);          //Less than or equal to Operator
result = (5 >= 6);          //Greater than or equal to Operator

first =! first;             //NOT Operator

//Ternary Operator (?)
// Variavel = (Condição) ? 'Se sim isso' : 'Senão isso';
// Example:

String greeting = '';
Integer hour = 10;
greeting = (hour < 12) ? 'Good Morning' : 'Good Afternoon';
System.debug(greeting);
// if hour is less than 12, then greeting should be good morning
// else greeting should be good afternoon