class Usuario {
  String nome;
  String email;
  String telefone;

  Usuario({
    required this.nome,
    required this.email,
    required this.telefone,
  });

  factory Usuario.fromMap(Map<String, dynamic> mapa) {
    return Usuario(
      nome: mapa['nome'] ?? '',
      email: mapa['email'] ?? '',
      telefone: mapa['telefone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'telefone': telefone,
    };
  }

  static Usuario? atual;
}