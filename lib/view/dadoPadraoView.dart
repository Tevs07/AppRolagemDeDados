import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/dadoPadraoController.dart';

class Dadopadraoview extends StatefulWidget {
  Dadopadraoview({super.key});

  @override
  State<Dadopadraoview> createState() => _DadopadraoviewState();
}

class _DadopadraoviewState extends State<Dadopadraoview> {
  final crtl = GetIt.I.get<Dadopadraocontroller>();
  int? _valor = 1;

  void _atualizar() => setState(() {});

  @override
  void initState() {
    super.initState();
    crtl.limpar();
    crtl.addListener(_atualizar);
  }

  @override
  Widget build(BuildContext context) {
    int X = 0;
    int Y = 0;
    int Z = 0;

    for (final r in crtl.resultado) {
      if (X < r) {
        X = r;
      }
    }

    if (crtl.resultado.isNotEmpty) {
      Y = crtl.resultado.first;
      for (final r in crtl.resultado) {
        if (Y > r) {
          Y = r;
        }
      }
    }

    for (final r in crtl.resultado) {
      Z += r;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Dado Padrão')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.format_list_bulleted, size: 30),
                            Text(
                              'Quantidade: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            DropdownButton<int>(
                              dropdownColor: Color(0xFF303030),
                              value: _valor,
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 5,
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (novoValor) {
                                setState(() {
                                  _valor = novoValor;
                                });
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final salvou = await crtl.sortear(_valor ?? 1);
                            if (!context.mounted) return;

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(
                                    salvou
                                        ? 'Rolagem salva no histórico com sucesso!'
                                        : 'Erro ao salvar a rolagem no histórico.',
                                  ),
                                ),
                              );
                          },
                          child: Text(
                            'Rolar',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ColoredBox(
                      color: Theme.of(context).colorScheme.primary,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            spacing: 15,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (final r in crtl.resultado)
                                Text(
                                  '$r',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),

                              Expanded(child: SizedBox(height: 20)),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "($Y)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),

                                        SizedBox(height: 8),

                                        Text(
                                          'Menor',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "($Z)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),

                                        SizedBox(height: 8),

                                        Text(
                                          'Total',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "($X)",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),

                                        SizedBox(height: 8),

                                        Text(
                                          'Maior',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
