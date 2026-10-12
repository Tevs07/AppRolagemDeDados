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

   @override
  void initState(){
    super.initState();
    crtl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
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
                labelText: 'Telefone: ex.: 55+ (67) 999999999',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),           
              ),
            ),

             SizedBox(height: 20),

            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.senha,
              obscureText: _alterarEstado, //deixar o texto obscuro
              decoration: InputDecoration(
                labelText: 'Senha',
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
              onPressed: () {
                if(crtl.email.text.trim().isEmpty || crtl.senha.text.trim().isEmpty || !crtl.email.text.trim().endsWith("@gmail.com") || crtl.confirmarSenha.text.trim().isEmpty || crtl.nomeUsuario.text.trim().isEmpty || crtl.telefone.text.trim().isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(
                        'Preencha os Campos Corretamente',
                        style: TextStyle(fontSize: 20)),
                        )
                      );
                } else {
                  Usuario.atual = Usuario(
                    nome: crtl.nomeUsuario.text.trim(),
                    email: crtl.email.text.trim(),
                    telefone: crtl.telefone.text.trim(),
                    senha: crtl.senha.text.trim(),
);
                  Navigator.pushNamed(context, 'menu');
                }
                
                },
              style: ElevatedButton.styleFrom(minimumSize: Size(120, 60)),
               child: Text(
                'Cadastrar',
                style: TextStyle(fontSize: 15),
                ),
               ),

            ]
            ),
        ),
      ),
      );
  }
}