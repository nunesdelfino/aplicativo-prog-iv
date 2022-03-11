class Pedido {
  final int id;
  final String nome;
  final String tipoOvo;
  final String status;
  final String contato;
  final String tamanho;
  final String saborUm;
  final String saborDois;
  final String saborTres;
  final String saborQuatro;
  final String saborCinco;
  final String observacao;
  final double preco;
  final String entregar;
  final String endereco;
  final String dataEntrega;
  final String statusEntrega;

  bool isExpanded;

  Pedido(
      {this.id,
      this.nome,
      this.tipoOvo,
      this.status,
      this.contato,
      this.tamanho,
      this.saborUm,
      this.saborDois,
      this.saborTres,
      this.saborQuatro,
      this.saborCinco,
      this.dataEntrega,
      this.entregar,
      this.endereco,
      this.preco,
      this.observacao,
      this.statusEntrega,
      this.isExpanded = false});

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id: json['id'] as int,
      nome: json['nome'] as String,
      tipoOvo: json['tipoOvo'] as String,
      status: json['status'] as String,
      contato: json['numero'] as String,
      tamanho: json['nomeTamanho'] as String,
      saborUm: json['nomeSaborUm'] as String,
      saborDois: json['nomeSaborDois'] as String,
      saborTres: json['nomeSaborTres'] as String,
      saborQuatro: json['nomeSaborQuatro'] as String,
      saborCinco: json['nomeSaborCinco'] as String,
      dataEntrega: json['dataEntrega'] as String,
      entregar: json['entregar'] as String,
      endereco: json['endereco'] as String,
      preco: json['preco'] as double,
      observacao: json['observacao'] as String,
      statusEntrega: (json['statusEntrega'] as bool).toString(),
    );
  }

  @override
  String toString() {
    return '{id: $id, nome: $nome, tipoOvo: $tipoOvo, status: $status}';
  }

  @override
  String toStringEntregas() {
    return '{id: $id, nome: $nome, tipoOvo: $tipoOvo, statusEntrega: $statusEntrega}';
  }
}
