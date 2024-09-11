import 'package:flutter/material.dart';
import '/model/user_model.dart';
import 'visualizar_screen.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _enderecoController = TextEditingController();
  String? _genero;
  final List<UserModel> _usuarios = [];

  void _salvarUsuario() {
    if (_nomeController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        _enderecoController.text.isEmpty ||
        _genero == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    setState(() {
      _usuarios.add(UserModel(
        nome: _nomeController.text,
        email: _emailController.text,
        telefone: _telefoneController.text,
        endereco: _enderecoController.text,
        genero: _genero!,
      ));
      _nomeController.clear();
      _emailController.clear();
      _telefoneController.clear();
      _enderecoController.clear();
      _genero = null;
    });
  }

  void _irParaVisualizar() {
    if (_usuarios.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nenhum usuário cadastrado')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisualizarScreen(usuarios: _usuarios)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField( 
              controller: _telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
            ),
            TextField(
              controller: _enderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Gênero:'),
                Radio<String>(
                  value: 'Masculino',
                  groupValue: _genero,
                  onChanged: (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                ),
                Text('Masculino'),
                Radio<String>(
                  value: 'Feminino',
                  groupValue: _genero,
                  onChanged: (value) {
                    setState(() {
                      _genero = value;
                    });
                  },
                ),
                Text('Feminino'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _salvarUsuario,
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: _irParaVisualizar,
                  child: Text('Ver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
