export interface GenericResponse {
  code: string;
  message: string;
  data?: Record<string, any>;
}