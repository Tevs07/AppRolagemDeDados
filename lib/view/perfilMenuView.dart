import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/perfilMenuController.dart';

class MenuPerfilView extends StatefulWidget {
  const MenuPerfilView({super.key});

  @override
  State<MenuPerfilView> createState() => _MenuPerfilViewState();
}

class _MenuPerfilViewState extends State<MenuPerfilView> {
  final crtl = GetIt.I.get<MenuPerfilController>();

  void _atualizar() => setState(() {});

  @override
  void initState() {
    super.initState();
    crtl.carregar();
    crtl.addListener(_atualizar);
  }

  @override
  void dispose() {
    crtl.removeListener(_atualizar);
    super.dispose();
  }

  void _aoTocarNoIcone() {
    if (crtl.editando) {
      final erro = crtl.salvar();

      if (erro != null) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(erro)));
      }
    } else {
      crtl.iniciarEdicao();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuário'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              SizedBox(height: 40),

              TextField(
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                controller: crtl.nomeController,
                readOnly: !crtl.editando,
                decoration: InputDecoration(
                  labelText: 'Nome de usuário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(crtl.editando ? Icons.check : Icons.edit),
                    onPressed: _aoTocarNoIcone,
                  ),
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                initialValue: crtl.email,
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),

              TextFormField(
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                initialValue: crtl.telefone,
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
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