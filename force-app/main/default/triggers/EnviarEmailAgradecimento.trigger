trigger EnviarEmailAgradecimento on Account (after update) {
    for (Account acc : Trigger.new) {
        Account oldAcc = Trigger.oldMap.get(acc.Id);

        Integer oldTotal = (oldAcc.Numero_de_Check_Ins_Totais__c != null) ? Integer.valueOf(oldAcc.Numero_de_Check_Ins_Totais__c) : 0;
        Integer newTotal = (acc.Numero_de_Check_Ins_Totais__c != null) ? Integer.valueOf(acc.Numero_de_Check_Ins_Totais__c) : 0;

        // Verifica marcos atingidos
        List<Integer> milestones = new List<Integer>{10, 50, 100};

        for (Integer milestone : milestones) {
            if (oldTotal < milestone && newTotal >= milestone) {
                // Enviar e-mail de agradecimento
                EnvioEmailAgradecimento.sendThankYouEmail(acc, milestone);
                break; // já encontrou o marco atingido, evita enviar múltiplos
            }
        }
    }
}