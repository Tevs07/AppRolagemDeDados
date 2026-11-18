import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:p1/model/usuario.dart';

class CadastroController extends ChangeNotifier {
  final nomeUsuario = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final senha = TextEditingController();
  final confirmarSenha = TextEditingController();
  bool carregando = false;

  Future<String?> cadastrar() async {
    final usuario = Usuario(
      nome: nomeUsuario.text.trim(),
      email: email.text.trim(),
      telefone: telefone.text.trim(),
    );
    final senhaTxt = senha.text;

    if (usuario.nome.isEmpty ||
        usuario.email.isEmpty ||
        usuario.telefone.isEmpty ||
        senhaTxt.isEmpty) {
      return 'Preencha todos os campos.';
    }
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(usuario.email)) {
      return 'Informe um e-mail válido.';
    }
    if (usuario.telefone.replaceAll(RegExp(r'\D'), '').length < 10) {
      return 'Informe um telefone válido, com DDD.';
    }
    if (senhaTxt.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(senhaTxt) ||
        !RegExp(r'\d').hasMatch(senhaTxt)) {
      return 'A senha deve conter letras e números.';
    }
    if (senhaTxt != confirmarSenha.text) {
      return 'As senhas não conferem.';
    }

    carregando = true;
    notifyListeners();

    User? novo;
    try {
      final res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usuario.email,
        password: senhaTxt,
      );
      novo = res.user!;

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(novo.uid)
          .set({...usuario.toMap(), 'uid': novo.uid}).timeout(
              const Duration(seconds: 15));

      Usuario.atual = usuario;
      _limpar();
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensagemErro(e.code);
    } catch (_) {
      await novo?.delete().catchError((_) {});
      return 'Não foi possível salvar seus dados. Tente novamente.';
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  void _limpar() {
    nomeUsuario.clear();
    email.clear();
    telefone.clear();
    senha.clear();
    confirmarSenha.clear();
  }

  String _mensagemErro(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Esse e-mail já está cadastrado.';
      case 'invalid-email':
        return 'O formato do e-mail é inválido.';
      case 'weak-password':
        return 'A senha é fraca. Use uma senha mais forte.';
      case 'network-request-failed':
        return 'Sem conexão com a internet.';
      default:
        return 'Não foi possível cadastrar ($code).';
    }
  }
}