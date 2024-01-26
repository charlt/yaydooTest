import bodyParser from "body-parser";
import express, { Request, Response } from "express";
import { invoiceRoute } from "./routes";
const fileUpload = require("express-fileupload");

const app = express();
const greeting = (req: Request, res: Response) => {
  res.send("Hello Yaydoo :)");
};

app.use(bodyParser.json());
app.use(fileUpload());
app.use("/", invoiceRoute);
app.post("/", greeting);
app.get("/", greeting);

app.listen(3000, () => {
  console.log("The server is listening on port 3000.");
});
