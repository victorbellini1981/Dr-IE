import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  TextEditingController txtnome = new TextEditingController();
  TextEditingController txtdescricao = new TextEditingController();
  TextEditingController txtvalor = new TextEditingController();

  @override
  void initState() {
    super.initState();
    enviaMsg();
  }

  enviaMsg() {
    Future.delayed(Duration(seconds: 2), () {
      if (mensagem != "") {
        // ignore: deprecated_member_use
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
            duration: Duration(seconds: 1), content: new Text(mensagem)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final nome = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome:',
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
      ),
      style: TextStyle(
        color: Colors.black,
      ),
      keyboardType: TextInputType.text,
      controller: txtnome,
      validator: (value) {
        if (value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );

    final descricao = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Descrição:',
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
      ),
      style: TextStyle(
        color: Color(0xffb22222),
      ),
      keyboardType: TextInputType.text,
      controller: txtdescricao,
      validator: (value) {
        if (value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    );

    final valor = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Valor:',
        labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold),
      ),
      style: TextStyle(
        color: Color(0xffb22222),
      ),
      keyboardType: TextInputType.text,
      controller: txtvalor,
      validator: (value) {
        if (value.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
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
              var comando = new bloc();
              setState(() {
                comando.getServidor();
              });
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
                SizedBox(height: 10),
                nome,
                SizedBox(height: 10),
                descricao,
                SizedBox(height: 10),
                valor,
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
