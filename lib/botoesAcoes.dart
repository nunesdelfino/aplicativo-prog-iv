
import 'package:flutter/material.dart';

import 'botaoItem.dart';

class LinhaBotoes extends StatelessWidget {
  final String botaoUm;
  final String botaoDois;
  final String botaoTres;
  const LinhaBotoes({
    Key key,
    this.botaoUm,
    this.botaoDois,
    this.botaoTres
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BotaoItem(texto: this.botaoUm),
        SizedBox(width: 10),
        BotaoItem(texto: this.botaoDois),
        SizedBox(width: 10),
        BotaoItem(texto: this.botaoTres),
      ],
      );
  }
}