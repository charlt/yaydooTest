import { Request, Response, NextFunction } from 'express';
import { GenericResponse } from '../interfaces/invoiceInterface';
import { InvoiceService } from '../services';
export default class InvoiceController {

  invoiceService: InvoiceService;

  constructor() {
    this.invoiceService = new InvoiceService();
  }

  async transformInvoice(req: Request, res: Response, next: NextFunction) {

    try {
      const response: GenericResponse = await this.invoiceService.transformInvoice();
      res.json(response);
    } catch (error) {
      console.log('errorController');
      res.json(error)
    }
  }
}