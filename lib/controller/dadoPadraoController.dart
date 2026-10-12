import 'dart:math';
import 'package:flutter/material.dart';

class Dadopadraocontroller extends ChangeNotifier{
  Random random = Random();
  List<int> resultado = [];

  void sortear(int quantidade) {
    resultado = List.generate(quantidade, (_) => random.nextInt(6) + 1);
    notifyListeners();
  }

  void limpar() {
  resultado = [];
}
}