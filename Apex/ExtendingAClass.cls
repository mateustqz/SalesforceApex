/*virtual keyword; Mark the method and the class as virtual;
Extending class can override and provide a new definition to the virtual method;*/

//Example:
public virtual class Marker {
    public virtual void write(){
        System.debug('Writing some text.');
    }
    public virtual Double discount() {
        return .05
    }
}
-----
//Extension for the Marker class
public class YellowMarker extends Marker{
    public override void write(){
        System.debug('Writing some text2.');
    }
}

-----
Marker obj1, obj2;
obj1 = new Marker();
obj1.write();

obj2 = new YellowMarker();
obj2.write();

Double d = obj2.discount();

//Exemplo 2
public virtual class StringWriter {
    public virtual void printString() {
        System.debug('This is the default String');
    }
}
public class HtmlStringWritter extends StringWriter {
    public override void printString() {
        System.debug('<p>This is a HTML String</p>');
    }
}
StringWriter sw1 = new StringWriter();
swl.printString();

HtmlStringWritter sw2 = new HtmlStringWritter();
sw2.printString();
