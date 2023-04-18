public class Covid19{
    private integer recoveredInArea = 0;
    private static integer recoveredInCountry = 0;
    public Covid19(Integer recoveredInArea){
        this.recoveredInArea = recoveredInArea;
        recoveredInCountry += recoveredInArea;
    }

    public void treatPacient(){
        recoveredInArea++;
        recoveredInCountry++;
    }

    public integer getTreated(){
        return recoveredInArea;
    }

    public static void printTreated(){
        system.debug('Recovered in Country: '+ recoveredInCountry);
    }
}