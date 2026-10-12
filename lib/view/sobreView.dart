import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true, //centraliza o texto
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 650,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Para o projeto da disciplina de Programação para Dispositivos Móveis, ministrada pelo professor Rodrigo Plotze na instituição de ensino superior Fatec RP, os alunos Estêvão de Paula e Alice Marino desenvolveram um aplicativo móvel para rolagem de dados.',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'A ideia do Dice Master nasceu a partir do contexto de jogos de RPG, onde são necessários dados para gerar aleatoriedade nos acontecimentos. Nesse contexto, o Dice Master permite rolar um ou mais dados com diversas quantidades de lados e salvar o histórico de rolagens. Assim, ele pode ser usado em RPGs e outros jogos em que os dados podem ser úteis.',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /*Align (
                alignment: AlignmentGeometry.center,
                child: Text('Para o projeto da disciplina de Programação para Dispositivos Móveis, ministrada pelo professor Rodrigo Plotze na instituição de ensino superior Fatec RP, os alunos Estêvão de Paula e Alice Marino desenvolveram um aplicativo móvel para rolagem de dados. A ideia de X nasceu a partir do contexto de jogos de RPG, onde são necessários dados para gerar aleatoriedade nos acontecimentos.'),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
