import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/configController.dart';

class Configview extends StatefulWidget {
  const Configview({super.key});

  @override
  State<Configview> createState() => _ConfigviewState();
}

class _ConfigviewState extends State<Configview> {
  final crtl = GetIt.I.get<Configcontroller>();

  void atualizar() => setState(() {});

  @override
  void initState(){
    super.initState();
    crtl.addListener(() => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              SwitchListTile(
                title: Text('Modo Escuro'),
                secondary: Icon(Icons.dark_mode),
                value: crtl.escuro, 
              onChanged: (valor) => crtl.alterar(valor),
              )

            ],
          ),
          )
        ),
      );
  }
}