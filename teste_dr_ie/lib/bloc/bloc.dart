import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste_dr_ie/variaveis_globais/globals.dart';

class bloc {
  getServidor() async {
    String url = 'http://192.168.0.105:3000/cad';

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = json.decode(response.body);

    mensagem = retorno['mensagem'];
  }
}
