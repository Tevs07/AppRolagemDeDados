import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RecuperarSenhaController extends ChangeNotifier {
  final email = TextEditingController();
  bool carregando = false;

  Future<String?> recuperarSenha() async {
    final emailTxt = email.text.trim();

    if (emailTxt.isEmpty) {
      return 'Informe o e-mail para recuperar a senha.';
    }

    carregando = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTxt);
      email.clear();
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'O formato do e-mail é inválido.';
        case 'user-not-found':
          return 'Não existe conta com esse e-mail.';
        case 'too-many-requests':
          return 'Muitas tentativas. Aguarde um pouco e tente de novo.';
        case 'network-request-failed':
          return 'Sem conexão com a internet.';
        default:
          return 'Não foi possível enviar (${e.code}).';
      }
    } catch (_) {
      return 'Erro inesperado. Tente novamente.';
    } finally {
      carregando = false;
      notifyListeners();
    }
  }
}