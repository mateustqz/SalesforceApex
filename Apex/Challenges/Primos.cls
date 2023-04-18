public class NumeroPrimo {
 	public static void calcularPrimo(integer numero){
        integer divisivel = 0;
        for(integer i=1;i<=numero;i++){
            if(Math.mod(numero,i)==0){
                divisivel++;
            }
        }
        if(divisivel==2){
            System.debug('O numero '+numero+' é primo');
        }
        else{
            System.debug('O numero '+numero+' não é primo');
        }
    }
}