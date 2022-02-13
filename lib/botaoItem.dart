
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';

class BotaoItem extends StatelessWidget {
  final String texto;
  final int id;
  final String acao;
  final Function fun;
  const BotaoItem( {
    Key key,
    this.texto,
    this.id,
    this.acao,
    this.fun
  }) : super(key: key);

  Widget build(BuildContext context){

    final ApiService api = ApiService();
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){
            api.modificarPedido(this.id, this.acao);
            fun();
          }, 
          child: Text(
            this.texto)
        )
      ],
    );
  }
}