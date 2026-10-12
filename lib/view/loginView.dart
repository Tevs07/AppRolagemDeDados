import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:p1/controller/loginController.dart';

class LoginView extends StatefulWidget {
   LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final crtl = GetIt.I.get<LoginController>();
  bool alterarEstado = true;

  @override
  void initState(){
    super.initState();
    crtl.addListener(() => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) { //inicio padrao
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar na Conta'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(  //inicio padrao

          
            children: [
             Icon(Icons.login, size: 60, color: Color(0xFF4B2D8F)),
            SizedBox(height: 40), //ícone de login
            
            //email
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.Email,
              decoration: InputDecoration(  //tem que colocar chefe -\_(-_-)_/-
                labelText: 'E-Mail',
                border: OutlineInputBorder( //alterar a borda
                  borderRadius: BorderRadius.circular(20) //deixa a borda mais arredondada
                )
              ),
            ),
            

            SizedBox(height: 10), //dar espaço

            //senha
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
              controller: crtl.Senha,
              obscureText: alterarEstado, //deixar o texto obscuro
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      alterarEstado = !alterarEstado;
                    });
                  }, 
                  icon: Icon(Icons.visibility_off),
                  ),
              ),
            ),
          
            SizedBox(height: 10), //dar espaço

            Align( //serve para colocar um widget em um espaço previamente alinhado
              alignment: AlignmentGeometry.centerRight, //deixar no meio a direita
              child: TextButton( //botao com texto
                onPressed: () { //definiri o que irá acontecer ao apertar o botão

                  Navigator.pushNamed(  //ir para a tela nomeada
                    context,
                    'recuperar_senha' //tela de recuperar senha
                    );

                }, //pode ser pressionado
                child: Text(
                  'Esqueceu a senha?',
                  style: TextStyle(fontSize: 15),
                  ),  //texto de 'esqueceu senha'
                ),
              ),

              SizedBox(height: 20,),
          
              ElevatedButton( //widget de botão com sombreamente para parecer que ta 'elevado'
                onPressed: () {

                  if (crtl.Email.text.trim().isEmpty || crtl.Senha.text.trim().isEmpty || !crtl.Email.text.trim().endsWith("@gmail.com")){
                    //o text e trim são necessários para usar a função isEmpty e EndsWith
                    //o ! na frente do ultimo é para indicar ao if "caso seja diferente de"
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(
                        'Preencha os Campos Corretamente',
                        style: TextStyle(fontSize: 20)),
                        )
                      );
                  } else {
                    Navigator.pushNamed(
                    context,
                    'menu',
                     );
                  }

                },
                style: ElevatedButton.styleFrom(minimumSize: Size(120, 60)),
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 15),
                  ),
                ),
            
          ],
          ),
        ),
      ),
      );
  }
}