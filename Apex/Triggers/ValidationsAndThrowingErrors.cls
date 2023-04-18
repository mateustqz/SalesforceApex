trigger LeadTrigger on Lead (before insert, before update) {
    for(Lead leadRecord : Trigger.new){
        if(String.isBlank(leadRecord.LeadSource)){
            leadRecord.LeadSource = 'Other';
        }
        if(String.isBlank(leadRecord.Industry) && Trigger.isInsert){
            leadRecord.addError('The industry field cannot be blank'); 
            //se entrar no if dispara o erro com essa mensagem e não permite salvar
        }
    }
}