
import 'package:fabricadechocolate/services/api_service.dart';
import 'package:flutter/material.dart';

class BotaoItem extends StatelessWidget {
  final String texto;
  const BotaoItem( {
    Key key,
    this.texto
  }) : super(key: key);

  Widget build(BuildContext context){

    final ApiService api = ApiService();
    return Column(
      children: [
        ElevatedButton(
          onPressed: (){
            // Como pegar o ID?
            api.aceitarPedidoPago("id");
          }, 
          child: Text(
            this.texto)
        )
      ],
    );
  }
}