import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/cadastroController.dart';
import 'package:p1/model/usuario.dart' show Usuario;

class Cadastroview extends StatefulWidget {
  const Cadastroview({super.key});

  @override
  State<Cadastroview> createState() => _CadastroviewState();
}

class _CadastroviewState extends State<Cadastroview> {
  final crtl = GetIt.I.get<CadastroController>();
  bool _alterarEstado = true;

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
      SnackBar(content: Text(texto, style: const TextStyle(fontSize: 20))),
    );
}

Future<void> _cadastrar() async {
  final erro = await crtl.cadastrar();
  if (!mounted) return;

  if (erro != null) {
    _mensagem(erro);
    return;
  }

  _mensagem('Conta criada com sucesso.');
  Navigator.pushNamedAndRemoveUntil(context, 'menu', (route) => false);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.nomeUsuario,
              decoration: InputDecoration(
                labelText: 'Nome de Usuário',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),           
              ),
            ),

             SizedBox(height: 20),

              TextField(
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                controller: crtl.email,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.telefone,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),           
              ),
            ),

             SizedBox(height: 20),

            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.senha,
              obscureText: _alterarEstado, 
              decoration: InputDecoration(
                labelText: 'Senha',
                helperText:  'Mínimo de 8 caracteres, com letras e números',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _alterarEstado = ! _alterarEstado;
                    });
                  }, 
                  icon: Icon(Icons.visibility_off),
                  ),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.confirmarSenha,
              obscureText: _alterarEstado, //deixar o texto obscuro
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _alterarEstado = ! _alterarEstado;
                    });
                  }, 
                  icon: Icon(Icons.visibility_off),
                  ),
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton(
  onPressed: crtl.carregando ? null : _cadastrar,
  style: ElevatedButton.styleFrom(minimumSize: const Size(120, 60)),
  child: crtl.carregando
      ? const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 3),
        )
      : const Text('Cadastrar', style: TextStyle(fontSize: 15)),
),

            ]
            ),
        ),
      ),
      );
  }
}