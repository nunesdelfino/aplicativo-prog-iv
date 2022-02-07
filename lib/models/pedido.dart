class Pedido {
  final int id;
  final String nome;
  final String tipoOvo;
  final String status;

  Pedido(
    {
      this.id,
      this.nome,
      this.tipoOvo,
      this.status,
    }
  );

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as int,
      nome: json['nome'] as String,
      tipoOvo: json['tipoOvo'] as String,
      status: json['status'] as String
    );
  }

  @override
  String toString() {
    return '{id: $id, nome: $nome, tipoOvo: $tipoOvo, status: $status}';
  }
}