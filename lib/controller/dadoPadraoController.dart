import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:p1/controller/historicoController.dart';

class Dadopadraocontroller extends ChangeNotifier {
  Random random = Random();
  List<int> resultado = [];

  Future<bool> sortear(int quantidade) async {
    resultado = List.generate(quantidade, (_) => random.nextInt(6) + 1);
    notifyListeners();

    // grava a rolagem no histórico e retorna se deu certo
    return await GetIt.I.get<HistoricoController>().salvar(6, resultado);
  }

  void limpar() {
    resultado = [];
  }
}