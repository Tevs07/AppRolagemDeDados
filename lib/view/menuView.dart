import 'package:flutter/material.dart';

class Menuview extends StatefulWidget {
  const Menuview({super.key});

  @override
  State<Menuview> createState() => _MenuviewState();
}

class _MenuviewState extends State<Menuview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 140,
            child: ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: Align(
                alignment: AlignmentGeometry.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  'Dice Master',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                Image.asset(
                'assets/dado.png',
                width: 60,
                height: 60,
                ),

                
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          children: [
                            Card(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context, 
                                    'dado_mais',
                                    );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.casino,
                                      size: 60,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      'Mais Dados',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Card(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context, 
                                    'dado_padrao',
                                    );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.casino_outlined,
                                      size: 60,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),

                                    SizedBox(height: 8),

                                    Text(
                                      'Dado Padrão',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 120,

            child: ColoredBox(
              color: Theme.of(
                context,
              ).colorScheme.primary, //retangulo colorido

              child: Padding(
                //mudar a margem do ícone (nesse caso quero afastar um pouco da borda da esquerda)
                padding: EdgeInsetsGeometry.all(20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      //ícone de botão
                      onPressed: () {
                        Navigator.pushNamed(context, 'config');
                      },

                      icon: Icon(
                        Icons.settings,
                        size: 70,
                      ),
                    ),

                    IconButton(
                      //ícone de botão
                      onPressed: () {
                        Navigator.pushNamed(context, 'menu_perfil');
                      },

                      icon: Icon(
                        Icons.account_circle,
                        size: 70,
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
