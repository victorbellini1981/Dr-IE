import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:teste_dr_ie/bloc/bloc.dart';
import 'package:teste_dr_ie/variaveis_globais/globals.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  Bloc bloc;

  TextEditingController txtnome = new TextEditingController();
  TextEditingController txtdescricao = new TextEditingController();
  MoneyMaskedTextController txtvalor =
      new MoneyMaskedTextController(leftSymbol: 'R\$ ');

  @override
  void initState() {
    bloc = Bloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nome = Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Nome:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.orange,
                ))),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            keyboardType: TextInputType.text,
            controller: txtnome,
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          )
        ],
      ),
    );

    final descricao = Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Descrição:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.orange,
                ))),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            keyboardType: TextInputType.text,
            controller: txtdescricao,
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          )
        ],
      ),
    );

    final valor = Container(
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Valor:",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          TextFormField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.orange,
                ))),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            keyboardType: TextInputType.number,
            controller: txtvalor,
            validator: (value) {
              if (value.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
          )
        ],
      ),
    );

    final btnEnviar = SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        // ignore: deprecated_member_use
        child: RaisedButton(
            color: Colors.orange[800],
            child: Center(
              child: Text(
                "Enviar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300),
              ),
            ),
            onPressed: () {
              if (txtnome.text.isEmpty) {
                // ignore: deprecated_member_use
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Digite o nome do produto!'),
                  duration: Duration(seconds: 3),
                ));
              } else if (txtdescricao.text.isEmpty) {
                // ignore: deprecated_member_use
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Digite a descrição do produto!'),
                  duration: Duration(seconds: 3),
                ));
              } else if (txtvalor.numberValue == 0.0) {
                // ignore: deprecated_member_use
                _scaffoldKey.currentState.showSnackBar(SnackBar(
                  content: Text('Digite o valor do produto!'),
                  duration: Duration(seconds: 3),
                ));
              } else {
                nomes = txtnome.text;
                descricoes = txtdescricao.text;
                valores = txtvalor.numberValue;
                bloc.postProduto();
              }
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0))));

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        automaticallyImplyLeading: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "Cadastro de Produtos",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                nome,
                SizedBox(height: 10),
                descricao,
                SizedBox(height: 10),
                valor,
                SizedBox(height: 20),
                StreamBuilder<String>(
                    stream: bloc.saida,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Erro de conexão com o Bloc');
                      } else {
                        return Text(
                          '${snapshot.data}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        );
                      }
                    }),
                SizedBox(height: 20),
                btnEnviar,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
