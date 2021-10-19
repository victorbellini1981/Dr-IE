import 'package:flutter/material.dart';
import 'package:teste_dr_ie/cliente/Inicial.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Teste Doutor-IE",
    home: Inicial(),
    theme: ThemeData(
      fontFamily: 'Montserrat',
    ),
  ));
}
