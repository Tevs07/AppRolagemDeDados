import 'package:cloud_firestore/cloud_firestore.dart';

class Rolagem {
  final String id;
  final int lados;
  final List<int> resultados;
  final DateTime data;

  Rolagem({
    this.id = '',
    required this.lados,
    required this.resultados,
    required this.data,
  });

  int get total => resultados.fold(0, (soma, r) => soma + r);

  factory Rolagem.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final mapa = doc.data();
    final ts = mapa['data'];

    return Rolagem(
      id: doc.id,
      lados: (mapa['lados'] as num?)?.toInt() ?? 6,
      resultados: ((mapa['resultados'] ?? []) as List)
          .map((e) => (e as num).toInt())
          .toList(),
      data: ts is Timestamp ? ts.toDate() : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lados': lados,
      'quantidade': resultados.length, 
      'resultados': resultados,
      'total': total,
      'data': Timestamp.fromDate(data),
    };
  }
}