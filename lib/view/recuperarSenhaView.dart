import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:p1/controller/recuperar_senhaController.dart';

class RecuperarSenhaView extends StatefulWidget {
  const RecuperarSenhaView({super.key});

  @override
  State<RecuperarSenhaView> createState() => _RecuperarSenhaViewState();
}

class _RecuperarSenhaViewState extends State<RecuperarSenhaView> {
  final crtl = GetIt.I.get<RecuperarSenhaController>();

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

  Future<void> _enviar() async {
    final erro = await crtl.recuperarSenha();
    if (!mounted) return;

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            erro ??
                'Se o e-mail estiver cadastrado, você receberá as instruções para criar uma nova senha.',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      );

    if (erro == null) Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                title: const Text('Recuperar Senha'),
                titleTextStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                centerTitle: true,
              ),

              const SizedBox(height: 30),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Preencha o campo para receber o E-Mail de troca de senha',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: crtl.email,
                style: const TextStyle(color: Color(0xFF4B2D8F)),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: crtl.carregando ? null : _enviar,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 60),
                  ),
                  child: crtl.carregando
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 3),
                        )
                      : const Text('Enviar', style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}