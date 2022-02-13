
import 'package:flutter/material.dart';

import 'botaoItem.dart';

class LinhaBotoes extends StatelessWidget {
  final String botaoUm;
  final String botaoDois;
  final String botaoTres;
  final int id;
  final Function fun;
  const LinhaBotoes({
    Key key,
    this.botaoUm,
    this.botaoDois,
    this.botaoTres,
    this.id,
    this.fun
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BotaoItem(texto: this.botaoUm, id: this.id, acao: "aceitar-pedido-nao-pago", fun: this.fun),
        SizedBox(width: 10),
        BotaoItem(texto: this.botaoDois, id: this.id, acao: "aceitar-pedido-pago", fun: this.fun),
        SizedBox(width: 10),
        BotaoItem(texto: this.botaoTres, id: this.id, acao: "cancelar-pedido", fun: this.fun),
      ],
    );
  }
}