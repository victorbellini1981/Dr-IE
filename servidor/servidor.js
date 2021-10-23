const http = require("http");
const express = require("express");
const cors = require('cors');
const app = express();
const dados = [];

app.use(cors());
app.use(express.json());

app.get("/", function(req, res) {
    res.send("<h1>Teste Dr-IE</h1>");
});

app.get("/msg", function(req, res) {
    res.json( { mensagem: "Cadastro efetuado com sucesso!!!" } );
});

app.post("/cad", (req, res) => {
    const { nome, descricao, valor } = req.body;
  
    const produto = {
      nome,
      descricao,
      valor,
    };
  
    dados.push(produto);
  
    return res.json(produto);
  });

http.createServer(app).listen(3000, () => console.log("Servidor rodando local na porta 3000"));