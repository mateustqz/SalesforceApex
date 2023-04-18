//Create a class with name 'Fitness' which has couple of methods to calculate human fitness.
//Create a method called 'calculateBMI' which accepts necessary parameter and returns bmi value. BMI = Body weight in KG/(Body Height in meter)^2
//Create a method 'calculatePace' which accepts necessary parameter and returns km per hour. Pace= distance in km/ time in minutes

public class Fitness{
    public static Decimal calculateBMI(Integer bodyWeight, Decimal bodyHeight){
        Decimal bmi = (bodyWeight)/(bodyHeight*bodyHeight);
        return bmi;
    }
    public static Decimal calculatePace(Decimal distanceKm, Decimal timeMin){
       	Decimal pace = (distanceKm)/timeMin;
        return pace;
    }
}