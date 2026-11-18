import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  final Email = TextEditingController();
  final Senha = TextEditingController();
  bool carregando = false;

  Future<String?> login() async {
    final email = Email.text.trim();
    final senha = Senha.text;

    if (email.isEmpty || senha.isEmpty) {
      return 'Preencha o e-mail e a senha.';
    }

    carregando = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      Senha.clear();
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensagemErro(e.code);
    } catch (_) {
      return 'Erro inesperado. Tente novamente.';
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  Future<String?> recuperarSenha(String email) async {
    final emailTxt = email.trim();

    if (emailTxt.isEmpty) {
      return 'Informe o e-mail para recuperar a senha.';
    }

    carregando = true;
    notifyListeners();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailTxt);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'Não existe conta com esse e-mail.';
      }
      return _mensagemErro(e.code);
    } catch (_) {
      return 'Erro inesperado. Tente novamente.';
    } finally {
      carregando = false;
      notifyListeners();
    }
  }

  String _mensagemErro(String code) {
    switch (code) {
      case 'invalid-email':
        return 'O formato do e-mail é inválido.';
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'E-mail ou senha incorretos.';
      case 'user-disabled':
        return 'Esta conta foi desativada.';
      case 'too-many-requests':
        return 'Muitas tentativas. Aguarde um pouco e tente de novo.';
      case 'network-request-failed':
        return 'Sem conexão com a internet.';
      default:
        return 'Não foi possível concluir ($code).';
    }
  }
}