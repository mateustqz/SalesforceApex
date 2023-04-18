/* A contract tha enforces what the child must do;
Only contains method declarations not definitions
Cannot be instantiated on their own*/

//Interfaces can only be called by another classes by using 'implements';
//Best practice: Start the interface with an 'I', to easy identify that is an interface; 

public interface IPurchaseOrder {
    //An interface that defines what a purchase order looks like in general
    Double discount();
}

//One implementation of the interface for costumers
public class CustomerPurchaseOrder implements PurchaseOrder {
    public Double discount() {
        return .05;  //Flat 5% discount
    }
}
------
//Example2
public interface IAreaCalculator {
    void computeArea();
}

public class SquareAreaCalculator implements IAreaCalculator {
    public void computeArea(){
        System.debug('Computes the area of a square');
    }
}
IAreaCalculator sac = new SquareAreaCalculator();
sac.computeArea();
