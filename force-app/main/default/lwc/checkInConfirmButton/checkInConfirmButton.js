import { LightningElement, api } from "lwc";
import { updateRecord } from "lightning/uiRecordApi";
import STATUS_FIELD from "@salesforce/schema/Check_In__c.Status__c";
import HORARIO_CHECKIN from "@salesforce/schema/Check_In__c.Horario_de_Check_In__c";
import ID_FIELD from "@salesforce/schema/Check_In__c.Id";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CheckInConfirmButton extends LightningElement {
  
  @api recordId;
  now = new Date().toISOString();

  async handleClick() {
    console.log("THIS.RECORDid = " + this.recordId);
    const fields = {};
    fields[ID_FIELD.fieldApiName] = this.recordId;
    fields[STATUS_FIELD.fieldApiName] = "Realizado";
    fields[HORARIO_CHECKIN.fieldApiName] = this.now;

    try {
      await updateRecord({ fields });

      this.dispatchEvent (
        new ShowToastEvent({
          title: "Confirmado",
          message: "O status e horário do check-in foram alterados com sucesso.",
          variant: "success",
        })
      )


      console.log("Check-in confirmed successfully.");
      console.log("VALOR ATUAL DO STATUS: " + fields[STATUS_FIELD.fieldApiName]);
      console.log("VALOR ATUAL DO HORARIO: " + fields[HORARIO_CHECKIN.fieldApiName]);
    
    
    
    
    } catch (error) {

      this.dispatchEvent (
        new ShowToastEvent({
          title: "Ocorreu um erro ao confirmar o Status e horário do Check-In",
          message: 
            "Possíveis causas: " +
            "- O Status já está definido como 'Não Realizado', por isso, não se pode mais alterar. " +
            "- O horário de Check-In só pode ser feito a partir de 48 horas antes do horário do voo." +
            "DETALHES DO ERRO:" + error.body.message,
          variant: "error",
        })
      )

      console.error("Error message:", error.message);
      console.error("Erro (completo):", error);
      console.log("VALOR ATUAL DO STATUS: " + fields[STATUS_FIELD.fieldApiName]);
      console.log("VALOR ATUAL DO HORARIO: " + fields[HORARIO_CHECKIN.fieldApiName]);
    }
  }
}
