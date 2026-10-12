import 'package:flutter/material.dart';

class CadastroController extends ChangeNotifier{
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  final telefone = TextEditingController();
  final nomeUsuario = TextEditingController();
}