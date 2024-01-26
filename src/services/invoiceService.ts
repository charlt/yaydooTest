import { Iconcepto, ItransformInvoice } from "../interfaces/invoiceInterface";
import { formatError } from "../utils";
import parse from "xml-parser";

export default class InvoiceService {
  async transformInvoice(invoice: Buffer) {
    try {
      const invoiceString: string = invoice.toString("utf-8");
      const invoiceJSON = parse(invoiceString);
      const { TipoDeComprobante, Total } = invoiceJSON.root.attributes;
      if (TipoDeComprobante !== "I") {
        throw formatError.DifferentTypeReceipt;
      }
      const complementoElement = invoiceJSON.root.children.find(
        (child) => child.name === "cfdi:Complemento"
      );

      if (!complementoElement || !Total) {
        throw formatError.FieldsNotFound;
      }
      const timbreFiscalDigitalElement = complementoElement.children.find(
        (child) => child.name === "tfd:TimbreFiscalDigital"
      );
      const receptorElement = invoiceJSON.root.children.find(
        (element) => element.name === "cfdi:Receptor"
      );
      const emisorElement = invoiceJSON.root.children.find(
        (element) => element.name === "cfdi:Emisor"
      );
      const conceptosElement = invoiceJSON.root.children.find(
        (element) => element.name === "cfdi:Conceptos"
      );
      if (
        !timbreFiscalDigitalElement ||
        !timbreFiscalDigitalElement?.attributes ||
        !timbreFiscalDigitalElement?.attributes?.UUID ||
        !timbreFiscalDigitalElement?.attributes?.FechaTimbrado ||
        !receptorElement ||
        !receptorElement.attributes ||
        !emisorElement ||
        !emisorElement.attributes
      ) {
        throw formatError.FieldsNotFound;
      }

      const uuid = timbreFiscalDigitalElement.attributes.UUID;
      const fechaTimbrado = timbreFiscalDigitalElement.attributes.FechaTimbrado;
      let conceptos: Iconcepto[] = [];
      if (conceptosElement && conceptosElement.children) {
        conceptos = conceptosElement.children.map((concepto) => {
          const descripcion = concepto.attributes.Descripcion;
          const importe = parseFloat(concepto.attributes.Importe);
          return { descripcion, importe };
        });
      }

      const data: ItransformInvoice = {
        total: parseInt(Total),
        fecha_timbrado: fechaTimbrado,
        uuid,
        emisor: {
          rfc: emisorElement.attributes.Rfc || "",
          nombre: emisorElement.attributes.Nombre || "",
          regimen_fiscal: emisorElement.attributes.RegimenFiscal || "",
        },
        receptor: {
          rfc: receptorElement.attributes.Rfc || "",
          nombre: receptorElement.attributes.Nombre || "",
          regimen_fiscal:
            receptorElement.attributes.RegimenFiscalReceptor || "",
        },
        conceptos,
      };

      return {
        code: "3000",
        message: "Success",
        data,
      };
    } catch (error: any) {
      console.log("errorService >>", error);
      if (error.code && error.message) {
        return error;
      }
      return formatError.internalError;
    }
  }
}
