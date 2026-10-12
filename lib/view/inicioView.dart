import 'package:flutter/material.dart';

class Inicioview extends StatefulWidget {
  const Inicioview({super.key});

  @override
  State<Inicioview> createState() => _InicioviewState();
}

class _InicioviewState extends State<Inicioview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: Image.asset(
                'assets/dado.png',
                width: 60,
                height: 60,
              ),
            ),
          ),

          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Text(
                        'Dice Master',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    SizedBox(height: 8),

                    Align(
                      alignment: AlignmentGeometry.center,
                      child: Text(
                        'Entre na sua conta ou crie uma nova para continuar',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),

                    SizedBox(height: 30),

                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          //ir para a tela nomeada
                          context,
                          'login',
                        );
                      },
                      label: Text(
                        'Entrar na Conta',
                        style: TextStyle(fontSize: 25),
                      ),
                      icon: Icon(Icons.login_outlined),
                    ),

                    SizedBox(height: 8),

                    OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(
                          //ir para a tela nomeada
                          context,
                          'cadastro_usuario', //tela de cadastrar usuario
                        );
                      },
                      label: Text('Cadastrar', style: TextStyle(fontSize: 25)),
                      icon: Icon(Icons.account_box_rounded),
                    ),

                    Expanded(child: SizedBox(height: 40)),

                    Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            //ir para a tela nomeada
                            context,
                            'sobre', //tela de cadastrar usuario
                          );
                        },
                        child: Text(
                          'Sobre o App',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
