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

  @override
  void initState(){
    super.initState();
    crtl.addListener(() => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    // base para todo view
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                title: Text('Recuperar Senha'),
                titleTextStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                centerTitle: true,
              ),

              //SizedBox(height: 100),

              /*Align(
                alignment: AlignmentGeometry.center,
                child: Text(
                  'Recuperar Senha',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),*/

              SizedBox(height: 30),

              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text(
                  'Preencha o campo para receber o E-Mail de troca de senha',
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer, fontSize: 15),
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: crtl.email,
                style: TextStyle(color: Color(0xFF4B2D8F)),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),

              SizedBox(height: 20),

              Align(
                alignment: AlignmentGeometry.center,
                child: ElevatedButton(
                  onPressed: () {
                    if (crtl.email.text.trim().isEmpty || !crtl.email.text.trim().endsWith('@gmail.com')){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                          'Preencha o Campo Corretamente',
                          style: TextStyle(fontSize: 20)),
                        )
                      );
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(
                          'Email de recuperação de senha enviado',
                          style: TextStyle(fontSize: 20)),
                        )
                      );
                    }
                  }, 
                  style: ElevatedButton.styleFrom(minimumSize: Size(120, 60)),
                  child: Text(
                    'Enviar',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}


