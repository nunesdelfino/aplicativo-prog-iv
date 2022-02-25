
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
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: Size(35.0, 50.0)),
          onPressed: () => onClickDialog(context, this.id, this.acao),
          //   api.modificarPedido(this.id, this.acao);
          //   fun();
          // }, 
          child: Text(
            this.texto, style: TextStyle(fontSize: 20),),
        )
      ],
    );
  }

  acaoButton(String acao){
    if(acao == "cancelar-pedido"){
      return "cancelar";
    }
    if(acao == "aceitar-pedido-nao-pago"){
      return "aceitar e definir como não pago";
    }
    if(acao == "aceitar-pedido-pago"){
      return "aceitar e definir como pago";
    }
  }

  onClickDialog(BuildContext context, int id, String acao) {

    final ApiService api = ApiService();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Deseja " + acaoButton(acao) + " o pedido Nº: " + id.toString() + "?" ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  api.modificarPedido(this.id, this.acao);
                  fun();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ação realizada!")));
                  print("Ação realizada!");
                },
              )
            ],
          ),
        );
      },
    );
  }
}