const http = require("http");
const express = require("express");
const app = express();

app.get("/", function(req, res) {
    res.send("<h1>Servidor rodando com sucesso</h1>");
});

app.get("/cad", function(req, res) {
    res.json( { mensagem: "Cadastro efetuado com sucesso!!!" } );
});

http.createServer(app).listen(3000, () => console.log("Servidor rodando local na porta 3000"));