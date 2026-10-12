import 'package:flutter/material.dart';
import 'dart:math';

class Dadomaiscontroller extends ChangeNotifier {
  Random random = Random();
  List<int> resultado = [];

  final List<int> tipo = [3, 4, 8, 10, 12, 20, 100];

  void sortear(int quantidade, int lados) {
    resultado = List.generate(quantidade, (_) => random.nextInt(lados) + 1);
    notifyListeners();
  }

  void limpar() {
    resultado = [];
  }
}
