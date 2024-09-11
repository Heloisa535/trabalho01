import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../widget/user_card.dart';

class VisualizarScreen extends StatelessWidget {
  final List<UserModel> usuarios;

  VisualizarScreen({required this.usuarios});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários Cadastrados'),
      ),
      body: usuarios.isEmpty
          ? Center(child: Text('Nenhum usuário cadastrado.'))
          : ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return UserCard(user: usuarios[index]);
              },
            ),
    );
  }
}
