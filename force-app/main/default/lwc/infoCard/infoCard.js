import { LightningElement, api, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";

// Campos que você quer acessar
import CLIENTE_LOOKUP from "@salesforce/schema/Check_In__c.Cliente__c";
import CLIENTE_NAME from "@salesforce/schema/Check_In__c.Cliente__r.Name";

export default class CheckInClienteViewer extends LightningElement {
  @api recordId;

  clienteName;

  @wire(getRecord, {
    recordId: "$recordId",
    fields: [CLIENTE_LOOKUP, CLIENTE_NAME]
  })
  checkInRecord({ error, data }) {
    if (data) {
      this.clienteName = data.fields.Cliente__r.displayValue || data.fields.Cliente__r.value.fields.Name.value;
    } else if (error) {
      console.error("Erro ao buscar dados do cliente:", error);
    }
  }
}
