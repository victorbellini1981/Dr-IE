const http = require("http");
const express = require("express");
const app = express();

app.get("/", function(req, res) {
    res.send("<h1>Teste Dr-IE</h1>");
});

app.get("/msg", function(req, res) {
    res.json( { mensagem: "Cadastro efetuado com sucesso!!!" } );
});

http.createServer(app).listen(3000, () => console.log("Servidor rodando local na porta 3000"));