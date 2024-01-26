import { Request, Response, NextFunction } from "express";
import { IGenericResponse, IfileObject } from "../interfaces/invoiceInterface";
import { InvoiceService } from "../services";
import { formatError } from "../utils";

interface CustomRequest extends Request {
  files: any;
}

export default class InvoiceController {
  invoiceService: InvoiceService;

  constructor() {
    this.invoiceService = new InvoiceService();
  }

  async transformInvoice(
    req: CustomRequest,
    res: Response,
    next: NextFunction
  ) {
    try {
      if (!req.files || !req.files.fileInvoice) {
        throw formatError.noFile;
      }

      const fileInvoice: IfileObject = req.files.fileInvoice;
      const fileExtension = fileInvoice.name.split(".").pop()?.toLowerCase();

      if (
        fileInvoice.mimetype !== "application/xml" &&
        fileInvoice.mimetype !== "text/xml"
      ) {
        throw formatError.invalidFileFormat;
      }

      if (fileExtension !== "xml") {
        throw formatError.invalidFileFormat;
      }

      const response: IGenericResponse =
        await this.invoiceService.transformInvoice(fileInvoice.data);

      res.json(response);
    } catch (error: any) {
      console.log("errorService >>", error);
      if (error.code && error.message) {
        res.json(error);
      }
      res.json(formatError.internalError);
    }
  }
}
