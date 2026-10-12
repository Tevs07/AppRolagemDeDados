import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:p1/controller/cadastroController.dart';
import 'package:p1/controller/configController.dart';
import 'package:p1/controller/dadoMaisController.dart';
import 'package:p1/controller/dadoPadraoController.dart';
import 'package:p1/controller/loginController.dart';
import 'package:p1/controller/perfilMenuController.dart';
import 'package:p1/controller/recuperar_senhaController.dart';
import 'package:p1/view/cadastroView.dart';
import 'package:p1/view/configView.dart';
import 'package:p1/view/dadoMaisView.dart';
import 'package:p1/view/dadoPadraoView.dart';
import 'package:p1/view/inicioView.dart';
import 'package:p1/view/loginView.dart';
import 'package:p1/view/menuView.dart';
import 'package:p1/view/perfilMenuView.dart';
import 'package:p1/view/recuperarSenhaView.dart';
import 'package:p1/view/sobreView.dart';

final g = GetIt.instance;
void main() {
  g.registerSingleton<LoginController>(LoginController());
  g.registerSingleton<CadastroController>(CadastroController());
  g.registerSingleton<MenuPerfilController>(MenuPerfilController());
  g.registerSingleton<Configcontroller>(Configcontroller());
  g.registerSingleton<Dadopadraocontroller>(Dadopadraocontroller());
  g.registerSingleton<Dadomaiscontroller>(Dadomaiscontroller());
  g.registerSingleton<RecuperarSenhaController>(RecuperarSenhaController());
  runApp(
    DevicePreview(
      builder: (context) => MainApp()
    )
  );
}

class MainApp extends StatelessWidget {
 MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final config = GetIt.I.get<Configcontroller>();

    return ListenableBuilder(
      listenable: config, 
      builder: (context, _) {

        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',

      theme: ThemeData(
        colorSchemeSeed: Color(0xFF4B2D8F),
        brightness: Brightness.light,
        textTheme: ThemeData(brightness: Brightness.light)
          .textTheme
          .apply(bodyColor: Colors.white, displayColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white
          ),
        )
      ),

      darkTheme: ThemeData(
        colorSchemeSeed: Color(0xFFF4B223),
        brightness: Brightness.dark,
        textTheme: ThemeData(brightness: Brightness.dark)
          .textTheme
          .apply(bodyColor: Colors.black87, displayColor: Colors.black87),
          iconTheme: IconThemeData(color: Colors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          
      ),
      themeMode: config.modo,

      initialRoute: 'inicio',
      routes: {
        //navegação de telas
        'login':(context) => LoginView(),
        'cadastro_usuario':(context) => Cadastroview(),
        'recuperar_senha':(context) => RecuperarSenhaView(),
        'sobre':(context) => SobreView(),
        'menu':(context) => Menuview(),
        'menu_perfil':(context) => MenuPerfilView(),
        'config':(context) => Configview(),
        'inicio':(context) => Inicioview(),
        'dado_padrao':(context) => Dadopadraoview(),
        'dado_mais':(context) => Dadomaisview(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      },
    );
      }
      );

    
  }
}