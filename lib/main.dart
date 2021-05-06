// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:leandro_meufrete/pages/consultafrete.dart';
import 'pages/cadastrotruck.dart';
import 'pages/menu.dart';
import 'pages/cadastro.dart';
import 'pages/login.page.dart';
import 'pages/sobre.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MeuFrete',
    initialRoute: '/login',
    routes: {
      '/login': (context) => LoginPage(),
      '/menu': (context) => MenuPrincipal(),
      '/cadtruck': (context) => CadastroTruck(),
      '/consfrete': (context) => ConsultaFrete(),
      '/cadastro':(context) => CadastroUsuario(),
      '/sobre': (context) => TelaSobre(),
    },


    
    theme: ThemeData(
        primaryColor: Colors.blue[900],
        backgroundColor: Colors.grey[100],
        fontFamily: 'Open Sans',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22, color: Colors.white, fontStyle: FontStyle.italic),
          headline2: TextStyle(fontSize: 18, color: Colors.blue[900])
        )
    )
  ));
}

