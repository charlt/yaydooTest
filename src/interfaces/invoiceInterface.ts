export interface IGenericResponse {
  code: string;
  message: string;
  data?: Record<string, any>;
}

export interface IfileObject {
  name: string;
  data: Buffer;
  size: number;
  mimetype: string;
}

export interface ItransformInvoice {
  total: number;
  uuid: string;
  fecha_timbrado: string;
  emisor: Iemisor;
  receptor: Ireceptor;
  conceptos: Iconcepto[];
}

export interface Iemisor {
  rfc: string;
  nombre: string;
  regimen_fiscal: string;
}

export interface Ireceptor {
  rfc: string;
  nombre: string;
  regimen_fiscal: string;
}

export interface Iconcepto {
  descripcion: string;
  importe: number;
}
