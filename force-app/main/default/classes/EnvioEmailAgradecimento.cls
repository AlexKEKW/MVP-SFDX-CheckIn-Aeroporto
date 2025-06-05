public class EnvioEmailAgradecimento {
    public static void sendThankYouEmail(Account acc, Integer milestone) {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();

        // Quem vai receber
        email.setToAddresses(new String[] { acc.Email__c }); // Certifique-se de que o campo Email__c existe

        // Assunto e conteúdo
        email.setSubject('🎉 Obrigado por sua fidelidade!');
        email.setHtmlBody(      // ou pode usar setPlainTextBody() se preferir texto simples
        '<html>' +
        '<body>' +
        '<h2 style="color:#2E86C1;">Parabéns, ' + acc.Name + '!</h2>' +
        '<p>Você acaba de atingir <strong>' + milestone + '</strong> check-ins em nosso programa de viagens 14-Bis.</p>' +
        '<p>Como forma de agradecimento, aqui está um <strong>cupom de desconto exclusivo</strong>:</p>' +
        '<div style="background-color:#D5F5E3;padding:10px;border-radius:5px;margin:10px 0;">' +
        '<strong>CUPOM14BIS' + milestone + '</strong>' +
        '</div>' +
        '<p>Use este cupom na sua próxima viagem!</p>' +
        '<hr>' +
        '<p style="font-size:12px;color:gray;">Equipe 14-Bis</p>' +
        '</body>' +
        '</html>'
    );

        // Enviar
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { 
            email 
        });
    }
}