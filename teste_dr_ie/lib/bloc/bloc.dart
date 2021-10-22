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

  getServidor() async {
    String url = 'http://10.0.0.233:3000/cad';

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    mensagem = retorno['mensagem'];

    entrada.add(mensagem);
  }

  @override
  void dispose() {
    blocControlador.close();
    super.dispose();
  }
}
