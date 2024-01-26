import { formatError } from '../utils';

export default class InvoiceService {

    async transformInvoice() {

        try {
            //const response = 
            throw formatError.genericError;

        } catch (error: any) {
            console.log('errorService >>', error);
            if (error.code && error.message) {
                return error;
            }
            return formatError.internalError;
        }
    }
}