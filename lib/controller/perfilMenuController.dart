import 'package:flutter/material.dart';
import 'package:p1/model/usuario.dart';

class MenuPerfilController extends ChangeNotifier {
  final TextEditingController nomeController = TextEditingController();
  bool editando = false;

  String get email => Usuario.atual?.email ?? '';
  String get telefone => Usuario.atual?.telefone ?? '';

  void carregar() {
    nomeController.text = Usuario.atual?.nome ?? '';
    editando = false;
  }

  void iniciarEdicao() {
    editando = true;
    notifyListeners();
  }

  
  String? salvar() {
    final novoNome = nomeController.text.trim();

    if (novoNome.isEmpty) {
      return 'O nome não pode ficar vazio.';
    }

    Usuario.atual?.nome = novoNome; 
    editando = false;
    notifyListeners();
    return null;
  }
}