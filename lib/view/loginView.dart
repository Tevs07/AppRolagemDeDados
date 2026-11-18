import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/loginController.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final crtl = GetIt.I.get<LoginController>();
  bool alterarEstado = true;

  void _atualizar() => setState(() {});

  @override
  void initState() {
    super.initState();
    crtl.addListener(_atualizar);
  }

  @override
  void dispose() {
    crtl.removeListener(_atualizar);
    super.dispose();
  }

  void _mensagem(String texto) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(texto, style: const TextStyle(fontSize: 20)),
        ),
      );
  }

  Future<void> _entrar() async {
    final erro = await crtl.login();
    if (!mounted) return;

    if (erro != null) {
      _mensagem(erro);
      return;
    }

    _mensagem('Login realizado com sucesso.');
    Navigator.pushReplacementNamed(context, 'menu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar na Conta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(Icons.login, size: 60, color: Color(0xFF4B2D8F)),
              const SizedBox(height: 40), 

              //email
              TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                controller: crtl.Email,
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 10), 

              //senha
              TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                controller: crtl.Senha,
                obscureText: alterarEstado, 
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        alterarEstado = !alterarEstado;
                      });
                    },
                    icon: const Icon(Icons.visibility_off),
                  ),
                ),
              ),

              const SizedBox(height: 10), 

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'recuperar_senha');
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: crtl.carregando ? null : _entrar,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 60),
                ),
                child: crtl.carregando
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Text('Entrar', style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}