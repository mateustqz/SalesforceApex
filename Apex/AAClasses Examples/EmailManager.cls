public class EmailManager{
    public static void sendMail(String Adress, String Subject, String Body){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAdresses = new String[] {Adress};
        mail.setToAdresses(toAdresses);
        mail.setSubject(Subject);
        mail.setPlainTextBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});  

    }
}