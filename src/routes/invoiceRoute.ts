import express from "express";
import { InvoiceController } from "../controllers";
const router = express.Router();
const invoiceController = new InvoiceController();

router.post(
  "/invoice/transformInvoice",
  invoiceController.transformInvoice.bind(invoiceController) as (
    req: express.Request,
    res: express.Response,
    next: express.NextFunction
  ) => Promise<void>
);

export default router;
