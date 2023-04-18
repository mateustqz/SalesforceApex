public class  FizzBuzzChallenge {
    public static void listNumbers(){
        for(Integer i = 0; i <= 100; i++){
            if(Math.mod(i,3) == 0 && Math.mod(i,5) == 0){
                System.debug('FizzBuzz');
            }
            else if(Math.mod(i,3) == 0){
                System.debug('Fizz');
            }
            else if(Math.mod(i,5) == 0){
                System.debug('Buzz');
            }
            else{
                System.debug(i);
            }
        }
    }
}