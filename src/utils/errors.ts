export const formatError = {
  internalError: {
    code: "1000",
    message: "Internal Server Error",
  },
  genericError: {
    code: "1001",
    message: "GenericError",
  },
  noFile: {
    code: "2001",
    message: "NoFile",
  },
  invalidFileFormat: {
    code: "2002",
    message: "InvalidFileFormat",
  },
  FieldsNotFound: {
    code: "2004",
    message: "FieldsNotFound(uuid, fechaTimbrado, total, emisor o receptor)",
  },
  DifferentTypeReceipt: {
    code: "2005",
    message: "DifferentTypeReceipt",
  },
};
