trigger AtualizaCheckInsTotais on Check_In__c (after insert, after update, after delete, after undelete) {
    Set<Id> accountIds = new Set<Id>();

    if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
        for (Check_In__c checkin : Trigger.new) {
            if (checkin.Cliente__c != null) {
                accountIds.add(checkin.Cliente__c);
            }
        }
    }

    if (Trigger.isDelete) {
        for (Check_In__c checkin : Trigger.old) {
            if (checkin.Cliente__c != null) {
                accountIds.add(checkin.Cliente__c);
            }
        }
    }

    List<Account> accountsToUpdate = new List<Account>();

    for (Id accId : accountIds) {      // Consulta os check-ins daquele cliente
        List<Check_In__c> checkins = [
            SELECT Id, Horario_do_Voo__c
            FROM Check_In__c
            WHERE Cliente__c = :accId
        ];

        Integer total = checkins.size();
        Integer noAnoAtual = 0;

        for (Check_In__c c : checkins) {
            if (c.Horario_do_Voo__c	 != null && c.Horario_do_Voo__c	.year() == Date.today().year()) {
                noAnoAtual++;
            }
        }

        accountsToUpdate.add(new Account(
            Id = accId,
            Numero_de_Check_Ins_Totais__c = total,
            Numero_de_Check_Ins_no_Ano__c = noAnoAtual
        ));
    }

    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate;
    }
}
