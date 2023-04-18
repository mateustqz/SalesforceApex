// Aggregate functions in SOQL, allow you to roll up and summarize your data in a query.

//Count of accounts
SELECT COUNT() FROM Account 

//Max opportunity amount
SELECT MAX(Amount) FROM Opportunity 

// Aggregate Functions:
AVG() - Returns the average value of a numeric field;
COUNT() and COUNT(fieldName) - Return number of rows;
COUNT_DISTINCT() - Returns the number of the distinct non_null field values;
MIN() - Returns the minimum value of a field;
MAX() - Returns the maximum value of a field;
SUM() - Returns the total sum of a numeric field;