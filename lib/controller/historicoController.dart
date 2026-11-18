import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:p1/model/rolagem.dart';

class HistoricoController {
  CollectionReference<Map<String, dynamic>>? _colecao() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;

    return FirebaseFirestore.instance
        .collection('usuarios')
        .doc(user.uid)
        .collection('rolagens');
  }

  Stream<List<Rolagem>> stream() {
    final colecao = _colecao();
    if (colecao == null) return Stream.value(<Rolagem>[]);

    return colecao
        .orderBy('data', descending: true)
        .limit(20)
        .snapshots()
        .map((snap) => snap.docs.map(Rolagem.fromDoc).toList());
  }

  Future<bool> salvar(int lados, List<int> resultados) async {
    final colecao = _colecao();
    if (colecao == null) return false;

    final rolagem = Rolagem(
      lados: lados,
      resultados: List<int>.from(resultados),
      data: DateTime.now(),
    );

    try {
      await colecao.add(rolagem.toMap());
      return true;
    } catch (e) {
      debugPrint('Erro ao salvar a rolagem: $e');
      return false;
    }
  }
}