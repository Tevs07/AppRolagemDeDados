import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:p1/controller/historicoController.dart';

class Dadomaiscontroller extends ChangeNotifier {
  Random random = Random();
  List<int> resultado = [];

  final List<int> tipo = [3, 4, 8, 10, 12, 20, 100];

  Future<bool> sortear(int quantidade, int lados) async {
    resultado = List.generate(quantidade, (_) => random.nextInt(lados) + 1);
    notifyListeners();

    // grava a rolagem no histórico e retorna se deu certo
    return await GetIt.I.get<HistoricoController>().salvar(lados, resultado);
  }

  void limpar() {
    resultado = [];
  }
}