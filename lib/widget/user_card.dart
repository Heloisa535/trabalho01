import 'package:flutter/material.dart';
import '../model/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${user.nome}'),
            Text('Email: ${user.email}'),
            Text('Telefone: ${user.telefone}'),
            Text('Endereço: ${user.endereco}'),
            Text('Gênero: ${user.genero}'),
          ],
        ),
      ),
    );
  }
}
