import 'dart:async';
import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_dr_ie/variaveis_globais/globals.dart';

class Bloc extends BlocBase {
  final blocControlador = BehaviorSubject<String>.seeded("");
  Sink<String> get entrada => blocControlador.sink;
  Stream<String> get saida => blocControlador.stream;

  postProduto() async {
    String url = 'http://192.168.0.105:3000/cad';

    http.Response response;
    final headers = {"Content-type": "application/json"};

    Map obj = Map();
    obj['nome'] = nomes;
    obj['descricao'] = descricoes;
    obj['valor'] = valores;

    String objjson = json.encode(obj);

    response = await http.post(Uri.parse(url), headers: headers, body: objjson);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    getServidor();
  }

  getServidor() async {
    String url2 = 'http://192.168.0.105:3000/msg';

    http.Response response2;

    response2 = await http.get(Uri.parse(url2));

    Map<String, dynamic> retorno2 = json.decode(response2.body);

    mensagem = retorno2['mensagem'];

    entrada.add(mensagem);
    print(mensagem);
  }

  @override
  void dispose() {
    blocControlador.close();
    super.dispose();
  }
}
