//Switch When Example
Switch on i {
    when 2, 3, 4 {
        System.debug('When block 2 and 3 and 4');
    }
    when 5, 6 {
        System.debug('When block 5 and 6');
    }
    when 7 {
        System.debug('When block 7');
    }
    when else {
        System.debug('Default');
    }
}

//Switch When Method Example
Switch on someInteger(i){
    When 2 {
        System.debug('when block 2');
    }
    when else {
        System.debug('Default');
    }
}

//Switch When sObject Example
Switch on sObject {
    when Account a {
        System.debug('Account ' + a);
    }
    When Contact c {
        System.debug('Contact ' + c);
    }
    When else {
        System.debug('Default');
    }
}

//Switch When with Enums
Switch on season {
    when WINTER {
        System.debug('boots');
    }
    when SPRING, SUMMER {
        System.debug('sandals');
    }
    When else{
        System.debug('none of the above');
    }
}

//Exercise
/* if current hour is in between 0-12 >> Good Morning
else if current hour is in between 12 to 17 >> Good Afternoon
else >> Good Evening*/

Integer currentHour = 12;
switch on currentHour {
    when 0,1,2,3,4,5,6,7,8,9,10,11{
        System.debug('Good Morning');
    }
    when 12,13,14,15,16{
        System.debug('Good Afternoon');
    }
    when else {
        System.debug('Good Evening');
    }
}

----------------------------------------------------------------------------------------

//If Else Statements
if(place == 1){
    medal_color = 'Gold Medal';
}
if(place == 2){
    medal_color = 'Silver Medal';
}
if(place == 3){
    medal_color = 'Bronze Medal';
}
else {
    medal_color = null;
}