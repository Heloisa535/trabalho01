import 'package:flutter/material.dart';
import 'view/cadastro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CadastroScreen(),
    );
  }
}
