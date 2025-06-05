trigger FormatCPF on Account (before insert, before update) {
    for (Account acc : Trigger.new) {
        if (acc.CPF__c != null) {
            String rawCpf = acc.CPF__c.replaceAll('[^0-9]', ''); //Remove todos os caracteres que não são números
            if (rawCpf.length() == 11) {
                acc.CPF__c = rawCpf.substring(0, 3) + '.' +
                             rawCpf.substring(3, 6) + '.' +
                             rawCpf.substring(6, 9) + '-' +
                             rawCpf.substring(9, 11);
            }
        }
    }
}