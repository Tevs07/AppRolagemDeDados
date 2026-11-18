import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:p1/controller/historicoController.dart';
import 'package:p1/model/rolagem.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({super.key});

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  final crtl = GetIt.I.get<HistoricoController>();
  late Stream<List<Rolagem>> _stream;

  @override
  void initState() {
    super.initState();
    _stream = crtl.stream(); // criado uma vez só
  }

  // recria o stream para tentar de novo depois de uma falha
  void _tentarNovamente() {
    setState(() {
      _stream = crtl.stream();
    });
  }

  String _mensagemErro(Object? erro) {
    if (erro is FirebaseException) {
      switch (erro.code) {
        case 'permission-denied':
          return 'Sem permissão para ler o histórico. Confira as regras do Firestore.';
        case 'unavailable':
          return 'Sem conexão com o servidor. Verifique a internet.';
        default:
          return 'Não foi possível carregar o histórico (${erro.code}).';
      }
    }
    return 'Não foi possível carregar o histórico.';
  }

  String _formatarData(DateTime d) {
    String dois(int n) => n.toString().padLeft(2, '0');
    return '${dois(d.day)}/${dois(d.month)}/${d.year} ${dois(d.hour)}:${dois(d.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: StreamBuilder<List<Rolagem>>(
          stream: _stream,
          builder: (context, snapshot) {
            // erro: mensagem e nova tentativa
            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        _mensagemErro(snapshot.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _tentarNovamente,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                ),
              );
            }

            // carregando
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            // vazio
            final rolagens = snapshot.data ?? [];
            if (rolagens.isEmpty) {
              return const Center(child: Text('Nenhuma rolagem ainda.'));
            }

            // lista em tempo real
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: rolagens.length,
              itemBuilder: (context, i) {
                final r = rolagens[i];
                final valores = r.resultados.join(', ');

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.casino),
                    title: Text('${r.resultados.length}D${r.lados}: $valores'),
                    subtitle: Text(_formatarData(r.data)),
                    trailing: Text(
                      'Total ${r.total}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}