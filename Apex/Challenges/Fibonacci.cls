public class FibonacciChallenge {
    public List<Integer> getFibonacci(){
        List<Integer> fibonacci = new List<Integer>{0, 1};
        Integer m,n,f;
        for(Integer i = 2; i <= 20; i++) {
            m = fibonacci.get(i - 2);
            n = fibonacci.get(i - 1);
            f = m + n;
            fibonacci.add(f);
            System.debug(f);
        }
        return fibonacci;
    }
}