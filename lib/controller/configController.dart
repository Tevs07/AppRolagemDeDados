import 'package:flutter/material.dart';

class Configcontroller extends ChangeNotifier{
  ThemeMode modo = ThemeMode.light;

  bool get escuro => modo == ThemeMode.dark;

  void alterar (bool ativarEscuro){
    modo = ativarEscuro ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}