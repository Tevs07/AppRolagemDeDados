class Usuario {
  String nome;
  String email;
  String telefone;
  String senha;

  Usuario({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.senha,
  });

  static Usuario? atual;
}