//Lists
List<Integer> rollNumbers = new List<Integer>{1, 2, 3}; //ou
List<Integer> rollNumbers = new List<Integer>();        //ou
    rollNumbers.add(1);
    rollNumbers.add(2);
    rollNumbers.add(3);
    rollNumbers.add(3);
    Integer rollNum = rollNumbers.get(1);          // get item on index 1
    Integer rollNumSize = rollNumbers.size();      // get the list size
    rollNumbers.add(4, 10);  //add item on index 4
    rollNumbers.remove(3);  //remove the item on index 3
    rollNumbers.set(1, 33);  //update item on index 1
    rollNumbers.clear();  //Clear the list

Integer[] rollNumbers = new List<Integer>();  //ou
List<Integer> rollNumbers = new Integer[1]    //ou ; size of the list
Integer[] rollNumbers = new Integer[1];       //ou



//Sets
Set<String> myStringSet = new Set<String>();
Set<String> myStringSet = new Set<String>{'New York', 'Paris'};
    myStringSet.add('Brasília');
    System.debug(myStringSet.contains('New York'));   //check if contains a value
    myStringSet.remove('Brasília');   //delete an item
    Integer setSize = myStringSet.size();   //get set size
    System.debug(myStringSet.isEmpty());    //check if set is empty
    rollNumbers.clear();   //Remove all itens



//Maps   Map<Key, Value>
Map<String, String> myMap = new Map<String, String>();
//Within the curly braces{}, specify the key first, then specify the value for that key using =>
Map<String, String> myMap = new Map<String, String>{'KeyString A' => 'ValueString A', 'KeyString B' => 'ValueString B'.toUpperCase()}; 
myMap.put('KeyString C', 'ValueString C'); //Add or Update a value
System.debug(myMap.get('KeyString A')); //give a key and Get a Value (Will debug ValueString A)
myMap.remove('KeyString C'); //remove an item from the map
Set<Integer> Keys = myMap.keySet();  //Get all the keys
List<String> Values = myMap.values();  //Get all the values
System.debug(myMap.containsKey('KeyString A'));








